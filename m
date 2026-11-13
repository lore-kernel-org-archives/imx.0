Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533543;
	b=HFzDLE3o0NwiMjInnTxrdQzrxLYBizGErMkgaDU7hLqC6NEwfCcv0av4qoi6tIPBFUhB
	 /3cSYjXDZmdnXlNHhM7BKJbeEmnqAyuuW9HDzxMkG8nxvMpb+d6KbykMG7MOQBOOD4vD5
	 M310inI+Ou2lBSQKHqP/22DQ8VkYPUCsh74Fso80iGdl08hc1/TE3tYI6zNainSMCwTUM
	 XJFfk+B1c4NNhjWQH2PDYzMIpiGHA0Ew95isgpeWrd+2g+XgRl2RVSwLjm98Rxted/H0f
	 r+F2gJ04C2hbLqKwJpYepYaMg0bvvqMi0/pQvha7zNq9FoYBVj0/EI/+iPgo76+raBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
	b=C5/UlYbeDsthnlebVwxmbqLUciErV7gX6/TWo9puYTHE+6vNKRWjVnRiR3vdBoIMcfNc
	 t0gmwc85qaamRmJrKzo9jipM6jCLsc2YCQ+iN5orR/aqKE8AVzqkxdUWwAYxHpmfucWct
	 /wc/gwDlfXgm8n5lXnxo6jVvLP4yge+kaWwiyNEcYfNcrRujZmz6c805oN09792KTJ9X1
	 AsSqFGPbJinm6N90WFn25CJk3Qk5vZi2E2qRxIK+b7A45L98+/sKLRmjoJp19oTX7q17X
	 NNoAR/iaj05A8achHF1mneuZe7tCU9mSA+e6zBH2Q+bSi2BoInYcYZWvKn+Q+edVfQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="HTm/xoqG";
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C07F606A31C
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 01:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C07F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HTm/xoqG
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-77bf892b496so126650137.0
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 17:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533541; x=1795138341; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=HTm/xoqGjB2dGsJPkfztnyJ5OTvo9YYNP4N2s5uIS93qvBxWfZr6hGC8NUMOEuc8WS
         0bH0DIz7CD4Lf9ey25GK1b0sYWCYfDyHJqHdpulyhUINndIIg8LAI9qnRenL5guIBQx/
         DX7nHW0s9xn+pBk6kdg2I6DaVahV2n51BK8fPxFlubry2yRBHDfN5tlerLuE4ztLvkHZ
         +MUCkHUxaSH5t1UN2Buz2B6KRebm1kmAMVLQYcq2vbQF0xxDFZKw9XZbzTWsYRQniUbp
         mwxhDxK9dK0AU/rpQRvmZmPrt/E0/m/vTbCDo1Dfxei75ovpQVcPKs980H6zyPkCtqbC
         3+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533541; x=1795138341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9HVV9rxTa8NDtE3CvH1N7rbiUfOat50MeJpUNT5hdrA=;
        b=gtZnCmbnOSIs8MwViJiscXkSMfoV8LqgelsaRfZ60iOZ8EpybLAtKe9STtXHdBMb65
         rnv0wklVs0B7SZ+0l0XaDiiJNInHhH17tGhyTuRnZYQkC+8QzdM+j3vS9GDvljOfDGo3
         7FVir/P8IwA4tvKjMI1D5JGYiKllYHQ8WMyxKVv+f6NBOCwQdkl/F051uB3KXHE6/1Iw
         QIRFX2jO/glNUS0Zn2egG7M3Dy6SDLXhnHCdV+hDtKXdLosWLVTL+Opi38SxgAO70Fdf
         JE+tKpa8NgxnWxEsTQYhZJfiBFYDr74/LPwRR1mUOYo4zg2hIqpVKLQYnkaeKJ8IsWSx
         YEsA==
X-Forwarded-Encrypted: i=1; AL+hErFEeDHlxNFQRMFnphs2uHEpZgYb1shvtS+6bepAFL/kX2KtZYgOny2Kk5uzCgvqGw3W6uo=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fQYiwyxBMD7JO2p7mQR15NBzGeiQTj/fckBeZMYF/95hLY/4U
	h7UgOt7oTvPyFtx3gk0KjpaiU0gUc/r3XWozhO1d+WJy+ARmje7UiEa2
X-Gm-Gg: AYBFou0i/JYRfwt/56HZmTyy72qk284vAioKG1gUQ6zxojoXh9DFA0azbNq5OKCUrKq
	nZCuqvipLrEEhqO9SAqm4hYxvisoDzZgO7b4S/2fFn6rCyG2rpSFQeqIVxeQT3oEB0K5U6aa91f
	2Gg6KkFIKC++KzTrBoxqWkhaO8KlqIycTfgr2ByDU48ovMLQRb6HZoSYbt3NxrNgAjITC2xt7MZ
	G5Qf7YRfvc6nSbGw3lcU3GhDBswF5/MNQAasov39Epod2tP70y8Eby5eHy4Ws0D3uWUnvwCcFrO
	QGoBVzbKyLAiVJdPyCRCHu5zeAkPNNM65iqD3R5BHUDXD5k3z3NZriQjwG8ijOvB9a7ZsVTDwZ1
	OC/0GRcHvV4z4og/gpSQw1/lOe0uMQSxTXBE20fyAHP5NpAJlRmVCo1gtha0fj6J5LoIA/Xdt10
	gR8KOWJaeh+7V33zuaySCfFJ99uGzv2HTmdiFK9ZkQCIcqWAgJKSqR8eCN6ZePw+8i2pX3VQSFO
	D5/nlABf6/xtQAP1ow1x5IFm16jN0FfmVHvVvBF004EgWxy23wb4AM0L3kqdXXspkK934+mh3Xl
	uw4HMZ8hPlwgzC1xP4xd1wRy4oCgjm13+mEVMOCa3bG5avVPoO17XA58Y0zDXX3EKtx4dhiPdKY
	IM7FPic64T8SZtX9HPZNTxg==
X-Received: by 2002:a05:6102:a4b:b0:7cc:1192:563c with SMTP id ada2fe7eead31-7d64d770298mr297767137.25.1794533541329;
        Thu, 12 Nov 2026 17:32:21 -0800 (PST)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a803:1afe:4b16:e82:1dda:bfc3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d64be7e2e9sm796166137.0.2026.11.12.17.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:32:20 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: lee@kernel.org
Cc: maz@kernel.org,
	andy@kernel.org,
	jic23@kernel.org,
	dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-iio@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: mfd: mxs-lradc: Fix interrupt order
Date: Thu, 12 Nov 2026 22:32:11 -0300
Message-ID: <20261113013212.470981-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The interrupt descriptions added during the conversion to YAML do not
match the ICOLL source numbers used by the existing DTS files.

For i.MX23, Table 5-1 of the reference manual maps source 36 to touch
detection and sources 37 through 44 to channels 0 through 7. imx23.dtsi
lists these sources in that order.

For i.MX28, Table 5-1 maps source 10 to touch detection, sources 14 and
15 to the threshold interrupts, sources 16 through 23 to channels 0
through 7, and sources 24 and 25 to buttons 0 and 1. imx28.dtsi also
lists these sources in that order.

Reorder the schema descriptions to match the hardware documentation and
the existing DT ABI.

Fixes: 009528b5aa13 ("dt-bindings: mfd: convert mxs-lradc bindings to json-schema")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes since v2:
- None. Only collected Krzysztof's tag.

 Documentation/devicetree/bindings/mfd/mxs-lradc.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
index 782b2f4005a0..755029880677 100644
--- a/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
+++ b/Documentation/devicetree/bindings/mfd/mxs-lradc.yaml
@@ -87,13 +87,13 @@ then:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: channel 0
         - description: channel 1
         - description: channel 2
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
     fsl,lradc-touchscreen-wires:
@@ -102,6 +102,7 @@ else:
   properties:
     interrupts:
       items:
+        - description: touchscreen
         - description: threshold 0
         - description: threshold 1
         - description: channel 0
@@ -110,11 +111,10 @@ else:
         - description: channel 3
         - description: channel 4
         - description: channel 5
-        - description: button 0
-        - description: button 1
-        - description: touchscreen
         - description: channel 6
         - description: channel 7
+        - description: button 0
+        - description: button 1
 
 additionalProperties: false
 
-- 
2.43.0

