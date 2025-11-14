Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8553731A7EA
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127513; cv=none; b=Ii4RBhoY6Ym2mgczYokDhQrzH6cl006NE6N+A0XNQpNBLr5cvx7zOnYOaV6hDkJrcK3QBbJI8OuYTWcf+esjYYC7Q0E+gXDvmTKTbLj6noIrd0uQQrUZzFa3NMF/m7TDv+GQvvvUED5/M3i3UT8yB4rd1LogBTF0B/wgGjcVzBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127513; c=relaxed/simple;
	bh=v9PIaHoOGqn87lRlESH/AuFgCy5K1+8Bo9hGHBVSeHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwD8HgIAdBXpuc0XinMZ8ef5rg3BKvWHqNqBSA5ZSU8w0Uj/kq/xUHvcKU3gvllDJ4qfqrCtMLP5g/rBvBoXJDmz/+lis3bnS4ES/xguvLE2Qev4V/ScK+uyYH9E5SJic+C7hWDOhBvpaE8GLknhAfYEJAgX1pgtrtJ9fbEDzWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+rIRL6b; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+rIRL6b"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b73161849e1so335680166b.2
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127510; x=1763732310; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=N+rIRL6bJ++oza1mFesIzoTKA4j1OPLtDo7oKIx7A/O6RnjlyRgQt7PAPm4NYPAjrY
         QLTPnzSGURCDKaeEM4CwFpilsPj03faYn4Ltgd3qT5j8EvvRShvlhiBIOHdaZ22qT+Wn
         yiIJhWOg2qFo23E2r3Q/fGE2bS1dkPCyVdP0/SV+w/jBdD4hQJD3+tFnpyI2Iow7fxrd
         avlDspE8SkdGnxav+CH0zz/DKVAvoL/s1HSIcfRYL6vFgibip+hKDdF4y5HEdRej3EZC
         PhSd0hwDbTFrkEL8ugImF4AFkVE0Zyk3cMwDHGL6CDpoF3NHEBOjRx6SVn/CDQsJmGE4
         FGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127510; x=1763732310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=W1J7MfD4joLEKOzIWGwzvgpqeEqkSecEyenhaZOWt34guQP0Ky3nmAsxDfqelAwAvf
         rmeB8nwqM2YsP8JCdeOQP9aHRQ3g9u3ckk2+RROh0dxVIJoJrTmT58+A7dkwR9TGHHSt
         EYMhoGh19v/CQ1mme4DYLawAxE3DfoBNh6gipf5/zh3bPOrR+Mgax90fBn9Jxq6XFvNL
         DoQ2WEvW/+g5XhPFZMbyW/Pk7V6uH/MUNFS4VNSlvY15SQiVkbJL+HX2DpDJ/9YuVYk/
         j1ivTdfMLGm1zNioFdRwnFmx4vvY1Okg2k5mHr5FTyHlb4d8eSBVoGjP7OROIxPw4nS8
         x3bA==
X-Forwarded-Encrypted: i=1; AJvYcCWh2YpjvD/Bca2NG/A/OMiH6GUbckdLM5Y+lUzoGNeDfpm+JQLO1Fp/2aK1W4jNvsrLaEw=@lists.linux.dev
X-Gm-Message-State: AOJu0YweVHrglG7IpQQOp0VsViGSgEXm0yvDE9vL1VDk+NwLuPRWek7D
	CADm8CUzDITe0iSN/VAu9cuTvKJudNWDgnhJpJQ+z9shakTaqgUlvIM8
X-Gm-Gg: ASbGnctJVpOm1exfocQnbYZ9qdqCTBbcNzDm2IfOAMgQ5Uj2XMqWQpgesd8oSQLFDuh
	uAifbygvEb2h/DVE2VCdiabQIZYVbgPzbEdUgxnJqGKnpM0K4JVIUm8PhEwS24ET1KDqXXNHvKg
	3zW5d3y8Lxko5DTv3hDXYe34DBCpoqgKXpiANEROwk8boc5r052ot3u5FSdQom52j5u48Hhop5F
	PkIeZfYo2R+ZMylbvpwqakp+BhHV17AcQ1vfqIMiMSERftDnf+NEMMqP5jugPnyB95etNRYT3kx
	fySruS4/I2ppAAT6RCOtd3x4iG8usoTVvLshFBJLuahGLg1AD5zac46CY38kk5mPKP09EGtDrJ7
	CWp0gqT9XgQRvFXpCD+KCW9M+9DTlyXnMqroKQJWKCkfwnZnrDfEhrV6nQ3nf2vVSUjrAEw+E1f
	Y221q9odwno+P1nAgZjjXW+gMvTfk=
X-Google-Smtp-Source: AGHT+IH8dRTU8oBtJVQfEpqvTrilhZpOv3fQsxhq77CfNcpisTXOvodnBkppi6eij0qssBp+fixOiw==
X-Received: by 2002:a17:907:9405:b0:b73:75ea:febf with SMTP id a640c23a62f3a-b7375eb040cmr72289266b.55.1763127509603;
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:29 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 6/6] arm64: dts: imx8ulp: add sim lpav node
Date: Fri, 14 Nov 2025 05:37:38 -0800
Message-ID: <20251114133738.1762-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "bus", "core", "plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0

