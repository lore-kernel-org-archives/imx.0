Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633E1152160
	for <imx@lists.linux.dev>; Sat,  1 Jun 2024 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717249960; cv=none; b=h5VJxLBlDKSO46ml3YVvSZWR5ivmz0W+c+gLRm1kKuSwaOn+aAkwTx4kTEVykQaQL+O4pjdGRAF1PhuqAFClvMjsxDtaJckqrsXYnzemXq/etDS5gxR5btbnZ6R0+QnaJdAzJ1rrKv/k3eyJYYiDSPLQhV/rJSfb9OWjlBfzyPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717249960; c=relaxed/simple;
	bh=1Dgwy0Q+GhrrVZfVCPhz54VGa+v3vTl0ATIGpU3b1r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIna42MUR+DJRWiI4H5BtE6whF8va2zNdfb68EADyXI58Ajno0vyq5RO88WHivlZYDzRy7qajxEV2+g38QGDCJeQOQ+Y5eG8HVqO3rv3hllz+3RTms+k1p62+ZLJHqvh4eHTZFohlq/OUZRfXEh++4lmXI5m8cWiwKAeEmS4SYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIgOErli; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIgOErli"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-36da84df7adso8134355ab.1
        for <imx@lists.linux.dev>; Sat, 01 Jun 2024 06:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717249958; x=1717854758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGka72aXhHw6B/ugmJ5D8SFrSBdPwgiFasgjGAhEvSI=;
        b=TIgOErliLmulY6kfpifQnUVAYQPiQq6f4PG+gOhzRqfbvukltDlg6IOoXVt2ejOyLa
         LCug93UwcdvT8qnCU8tISZS9jw8Om3Rwr3Iqs+AE/CY1zZvLWH9z0iLAv4V3VLuIn3PA
         63iFPh4cCJgFZh+IQO3aYgcIPsx35UnVUzLCnWyUcW6njeAbnyhsWzfKGtALLXKg2JK5
         9S1evmlXZWu68GEDhVHPd24pLskL5U7FE77ikUB3chk2mpdTqabeHrLE6cQzHQ5V50y2
         6SNVfj5CqN+rSx+gThAb5yEk/cm2aUcwq3ZKxGLes9Vng6oHt5G/Q+j4AI5/f3Njg7F8
         BB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717249958; x=1717854758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGka72aXhHw6B/ugmJ5D8SFrSBdPwgiFasgjGAhEvSI=;
        b=RoV+LG8QAhsLCcHGgTl2QM41wYR8WnMTzkvcCD7BQxnaDFxx+ue+BqLPeLrbe2VuKD
         cbU+MIz4tnwPjCz1cxWGbPyfSw1PEPUvh3hDQWAcNHvVAaQL5g3hl7cLOXAi32U7Dmks
         oHGljEiKrCr3hjygHWd0v2a+AgMGTASzi3O/fZP0U7efSgkknyqpQFrx8+Py2/dyNpPw
         SoNmkyzzCHWxofbmzaFJo+Z3MXRCZs0IQwONLuH+9+fUAwcqt16ip2arls86v4HMA3Cv
         N7U0S+WGLbvDpdrpqqHca7Rh3gz+ERdOj7DuKliqb7y2JbGwx71d6rB7fUntGj41616L
         NKHg==
X-Forwarded-Encrypted: i=1; AJvYcCU2ckixka/lgE38REU/sDJ5jQhQvcDIMErprpbJzTZgm6u2pzVa/Lm+FeoMHgf2FZTdW2reJPPCGKukYnR/dTYv42yR
X-Gm-Message-State: AOJu0Yx42P+tlNByOIjzG7IFUiSAv4NNwM1ic8OoyvB9QPg8S7zfo5od
	nWtgV0q3RPnJsC/D8J2MfwDSVfwlQvkM554W6I6g1GSsS4YpsgQjPAlzXw==
X-Google-Smtp-Source: AGHT+IHNarKWZy9HAtQK8XU6dQr4Zrxypy/AD5KjenkEvnfFzfikvYAeTK9czkeEyJLIysD+wU5U3A==
X-Received: by 2002:a92:cd8a:0:b0:373:1137:cc1e with SMTP id e9e14a558f8ab-3747e20bf3fmr60551865ab.7.1717249958498;
        Sat, 01 Jun 2024 06:52:38 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:e0b7:c613:ee:e8f3])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b56e7824d4sm556349173.172.2024.06.01.06.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jun 2024 06:52:37 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3 2/2] arm64: dts: imx8mp-beacon-kit: Fix errors found from CHECK_DTBS
Date: Sat,  1 Jun 2024 08:52:29 -0500
Message-ID: <20240601135230.89980-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240601135230.89980-1-aford173@gmail.com>
References: <20240601135230.89980-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adv7535 has some unnecessary entries which can be removed since
they were not setup properly anyway and the defaults work just fine.
Removing them and adding some required regulators make the errors
detected from CHECK_DTBS go away:

 reg-names:1: 'edid' was expected
 reg-names:2: 'cec' was expected
 'avdd-supply' is a required property
 'dvdd-supply' is a required property
 'pvdd-supply' is a required property
 'a2vdd-supply' is a required property
 'v3p3-supply' is a required property

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  No Change

V3:  Update commit message, no functional changes.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index da836172ae46..5c4b68c18bb2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -302,12 +302,19 @@ pca6416_3: gpio@20 {
 
 	adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
-		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
-		reg-names = "main", "cec", "edid", "packet";
+		reg = <0x3d>;
+		reg-names = "main";
 		interrupt-parent = <&gpio4>;
 		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
+		avdd-supply = <&buck5>;
+		dvdd-supply = <&buck5>;
+		pvdd-supply = <&buck5>;
+		a2vdd-supply = <&buck5>;
+		v1p2-supply = <&buck5>;
+		v3p3-supply = <&buck4>;
+
 
 		ports {
 			#address-cells = <1>;
-- 
2.43.0

