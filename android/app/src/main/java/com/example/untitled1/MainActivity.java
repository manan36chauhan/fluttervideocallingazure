package com.example.untitled1;

import android.os.Bundle;
import androidx.annotation.NonNull;
import com.azure.android.communication.calling.Call;
import com.azure.android.communication.calling.CallAgent;
import com.azure.android.communication.calling.CallClient;
import com.azure.android.communication.calling.CommunicationTokenCredential;
import com.azure.android.communication.calling.JoinMeetingOptions;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.example.azure/communication";
    private CallClient callClient;
    private CallAgent callAgent;
    private Call call;

    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                (call, result) -> {
                    if (call.method.equals("startCall")) {
                        String token = call.argument("token");
                        String groupId = call.argument("groupId");
                        startCall(token, groupId);
                        result.success("Call started");
                    } else {
                        result.notImplemented();
                    }
                }
        );
    }

    private void startCall(String token, String groupId) {
        callClient = new CallClient();
        CommunicationTokenCredential communicationTokenCredential;
        try {
            communicationTokenCredential = new CommunicationTokenCredential(token);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        try {
            callAgent = callClient.createCallAgent(getApplicationContext(), communicationTokenCredential).get();
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }
        JoinMeetingOptions joinMeetingOptions = new JoinMeetingOptions();
        call = callAgent.join(getApplicationContext(), groupId, joinMeetingOptions);
    }
}
