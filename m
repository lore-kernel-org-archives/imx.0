Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224AF2343AE
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 09:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572779; cv=none; b=eMMWF+H2947YcrG0b7sS1I0/+6l1NLRhHxWC8aTelHjzx5R0hZMATu6vCmIAev2pFXZkX/pAeR2pfJGzMwOSOvCyHS2Q68yOoYI9K9frFAENEGSnB0KzfbqfyKuruuRrYEpAP3tVOlvHa8mHAo48ixPCQheZTp1Pr614i1Hrojc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572779; c=relaxed/simple;
	bh=V26+KD33m0aJZN0gGO/Xy5/bV6re183KaQZL3zie4PQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FrDEmNPbJKtuEaVXgunbQ60YfzCt2LlZpjZZa1pgiugmh9tKom3cn4XswpD1VEf+/ERWfSOH9e8G6bKzho4wreezWQwau+4oJ8xUzNuPXOu0zIzTExTfehpwiRz5b/iHFsLQgDImPi0zirZb7Kp/Zn/64kR3YFuXPk3VsiEuBG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZsiYFE7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZsiYFE7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so2074507e87.1
        for <imx@lists.linux.dev>; Fri, 25 Apr 2025 02:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745572776; x=1746177576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bCu4gnKGLji0Lj1TJspCZ0JNdQdRUdGQa5Ujm73xOi4=;
        b=HZsiYFE7o2HZjrJiD5Op6tkdy+yaqPlwGR9z8JtYgOwzYjzwINxTiv+9iEs0h5h5lE
         wc0Pbx8WOJlmqBcNwE18HQNK7IlVnrML2nXMBt4Car8DSkhFpGzPirWXpoUh36940p4X
         j21K4Mp7WkX+LLvOIHlP5EEiBNOjxKrmAi9jeJDw6lVUqXSSZAW6KnFAfxkk4EkuuYNr
         AoP8+v7ciQhip/rQOIbHFkueIpvBMWmGuEDcQkdgZPwKHPC0M4thk+zy+eFwt17b4QC1
         13Hg/KKDjmOzok3WSrXnfA2C8SHRayF4synq9euX8wdDznOt18nAJFn6zXyX9ho+yxUv
         daJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745572776; x=1746177576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bCu4gnKGLji0Lj1TJspCZ0JNdQdRUdGQa5Ujm73xOi4=;
        b=d/MjBSZ6R2hBMzEWA+qC/AGktPHb5TyA2A94JEYcHLB1Gswlx9urFhypUNEXOpstnr
         wRc1rIXzvLzCwZ3TDGnw4Q8VO5io/xjizoUpGFc2sNsLUQEQqxiQB8c33kGorYsaZdF5
         MmTXGVLO4TxXEHsXqh1QEbznUaWKXb/Vug7DvP1Mg3ot8i91mRK8r2RbZXyVZjjrtVpy
         o7mL4ZNAlPe0NN6CzLiNie5EE/2faUy7JopxwvIcZNz8KqzTPFKfgFsjMFaZHLEBKMBx
         RBRue4W5JYvwncrp4m2nx0FtoIz83Z7/EaJJu6WODDGbW8eKe2ux9OunBWn8PyUOm/9W
         DEBA==
X-Forwarded-Encrypted: i=1; AJvYcCUQFDe2Ot90GSF8ar8M7E2fIqPHLa0TAx1tzDHzvpQYCHIdp/XvF/EE6LZn6fBl+PD3BP0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFJukHvIu+zKfW1HusZt05XQxICVHWXySPhNJncuj9DbCoD/An
	w1cXSDVux9/gnUc545dmdXWF3S5vDqvZjNZuMQzypXu45wQr4hpu
X-Gm-Gg: ASbGncskOzPM8Qyf6uxocjj4a9pK4H30mYcfozvCHF6mWkVGpXaDOG0RmocKIvZ2dMo
	Bu3+qcmjNOOwqQ6dnM+04gx6YsO9ozAElUWMvjke3uyUWfKdYEv65TsAJrlSd2d8GbZnUi/6+tK
	zfWMwtj8Ldsr7xlSGPNt+0JIQgI+OsQLg1FSYSeqFA1jji2DsmteBLuEO7i3jtatUQ0IKsv8eNW
	4AGmiWEQnB0ZWZxD8jWzVzVzePYKdm0rBvAe7ehVDWZQr9gskLxK+SB2EM0dLe/aL/eSvVNwEg2
	tyGjXSZ5pX8CNSyoZ1tFxqVA2Fhe4M/u2PlV9QDm/ouBfikyvwZkrKuzsdBEMGzW527Nn2YLIdD
	TfnqPR5UnyppZ3ktb29IpBH/AwvWffkusmyLD8YI=
X-Google-Smtp-Source: AGHT+IFQdGmsvgDmR6TVPSbh/xxX9pxHi/YRxyBrg1Y1rk5Z58OPuXPUin/wfhblrZ2GuZjz8ygL5w==
X-Received: by 2002:a05:6512:b05:b0:545:381:71e with SMTP id 2adb3069b0e04-54e8cc07e43mr451893e87.40.1745572775998;
        Fri, 25 Apr 2025 02:19:35 -0700 (PDT)
Received: from IRS-520670-Linux.atlascopco.group (84-217-94-150.customers.ownit.se. [84.217.94.150])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-54e8c7f02d9sm214299e87.78.2025.04.25.02.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:19:35 -0700 (PDT)
From: =?UTF-8?q?Efe=20Can=20=C4=B0=C3=A7=C3=B6z?= <efecanicoz@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Efe=20Can=20=C4=B0=C3=A7=C3=B6z?= <efecanicoz@gmail.com>
Subject: [PATCH] ARM: dts: imx7d: update opp-table voltages
Date: Fri, 25 Apr 2025 11:18:40 +0200
Message-ID: <20250425091853.54437-1-efecanicoz@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update accepted voltage levels according to IMX7DCEC Table 9 Operating ranges

Signed-off-by: Efe Can İçöz <efecanicoz@gmail.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
index 0484e349e064..d961c61a93af 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7d.dtsi
@@ -48,7 +48,7 @@ cpu0_opp_table: opp-table {
 
 		opp-792000000 {
 			opp-hz = /bits/ 64 <792000000>;
-			opp-microvolt = <1000000>;
+			opp-microvolt = <1000000 950000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xd>, <0x7>;
 			opp-suspend;
@@ -56,7 +56,7 @@ opp-792000000 {
 
 		opp-996000000 {
 			opp-hz = /bits/ 64 <996000000>;
-			opp-microvolt = <1100000>;
+			opp-microvolt = <1100000 1045000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0xc>, <0x7>;
 			opp-suspend;
@@ -64,7 +64,7 @@ opp-996000000 {
 
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
-			opp-microvolt = <1225000>;
+			opp-microvolt = <1225000 1200000 1250000>;
 			clock-latency-ns = <150000>;
 			opp-supported-hw = <0x8>, <0x3>;
 			opp-suspend;
-- 
2.43.0

