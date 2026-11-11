Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423872;
	b=Em04ugyPF6YV4yI8QAyueecoLzym4Ymq+GFr7rYo/iIkWoZ+JwPRGt08H536DK/J0eNY
	 neinC6hDFLJwQegJQ6eKJLj2STIvhCZowAhIdeGlrDxjBEZ9Kwk6qi6Ei0V6JYmaH7Aqh
	 agWHjDhjRPxIqkaLkYvOtu+XFNEvYFz08Z5rHK2KyWJqR4r0d22TBsvHjAosjHnoLofZm
	 02OrPQPj9l8uqJ1j0A4kbH9w8Xv2dI2ilv2hMO5I0eFbJuheR4msH2ipbMEs8Pn1ARFp0
	 14dbhVPklrvgXjLpENo6++ivZSbakMQQ/McYOTqXs1qfdjXce/78LtcPEj/Q5pXzG2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423872;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
	b=uO3wVUF2fZtgyVt3qoy8gkoAoWeCsLH0AMFkHxm+gkATaeMOLVNZ49MaFcmInWO7svad
	 zbNdqjb9DKJWqtc4f/GBzRdXXRiGh2qCiLbMlxdus1maAQmI0b6kyrfexnqDav7HZ5Fcr
	 vQTLZ3wOImAiD6l27kRstUGLnXslZ+6Acig1nq83hb11SFxM89JEp/JmqBbYf6Jlt5lk9
	 Vq0QgnzDy8OwJyrzCIhqwiERMrW5byH6wq9g2WT1kWL2YmH5uPPyeVkVCM9SF7QLBC9TX
	 vRfowHSdvzgR3gaSsIK7bBKYakQBYApWiyt9/hPU6bMPzSGpSqHUUgUWg2KO/85IhYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAxjD57H;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C8B606A31C
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4C8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eAxjD57H
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so1987109a91.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423871; x=1795028671; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=eAxjD57HNO87EauvIDcGtXYi7N5cjdjj3YoJ7tsRT8eB49GNEofRkUop+nIrLMxx9Y
         dCVl0tQK0eDvPSu5KNCD+Rb05M8dlzIat5v16FxeBt4Lord318gyMoGiXAlQFFGMmsk/
         e5a7GI4ZjFY3EMqmDIT4u6gUB6IZm4EiFdFQO5S1o8c1ZCodayaCknXEjU34FqJfc2PP
         oY5U4kC32DQ5fbq274WYTchPOizF6nZ6gYhPy+9ndP2M/dkuGL29yb/ldGzclKmTLKo5
         htS+rvUfC74K59U50YzSQfR7PThqgIdiJkl8lUZx100chAMxlej5IRhbEgHEaLEK9X+z
         05UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423871; x=1795028671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkBYOithnFO0IRX31SXjaTHWPBNV9b7p8e5gc+6w+Pw=;
        b=IfQ5zJCWn1dS9eR1UpHl7AA5zFhy4eTBFP9xSNQl88grZwY795Adyv7SkVS9U76B/M
         a+mkvQTWugxb9/T41DQ4qIiCweGO5q/kce+fXIRVF+/H145q3g8uQjhEWB7qRnRXgp1T
         JYEljFvffoo2itGGhH/1oQnWRmgneHZWhSKhRBA22ddOK+8gSPcfmvOF2mCOF02XAvjc
         jysSJy1Y0vTI9rJKZa1EDouS0ZBdXb8FX17DAFRAXMEpF7G0Y+udOOGUWBi1AELWYJuu
         KUz6Hus7rV+sPpdTveH7Dz5UdFY+DYtTIh+8DOJf8lQqyvmGIJiTw04IUrYv2PCvrHa+
         Vs0Q==
X-Forwarded-Encrypted: i=1; AL+hErF7rTcmnDs87i/3xbULcCiAtp6JUAN7HdaltA+RRAN2T1lIg3I59H5Q3S4JXZH9/Xx2l6c=@lists.linux.dev
X-Gm-Message-State: APuU4Z8jH29QEZFVVCnpU7/WAateFu4NmPdPKjzssgCqOkF1LOUR8UuJ
	M7ZtlkyX0Ss5jlgvLzQ80UNonuvJWDLK8qKspLlO0RHJTTVGeBEN0OrB
X-Gm-Gg: AYBFou311d3T5jLCfCPye3JU/S46fT5O/cTl1kb3DkDo6pdAXTaDaoJ/0UEIHIWvTqn
	kwgvN+eQt4A2CBEOU1FBLILbyiw4b8SMx4RL+xlYK8yuRIOAyzkIoZ881q+CVD6cZ6IB49+ao29
	ngz5UOmDBX24xXjHrX28e2553xCCxKRSXXCJjMtdy1rcXsdhw6VTVeCH86BJkqIwcm88s5GDIZx
	f6lPYCm+8gZ3Ze/KZ34rGD7zH22+7vjeTreNIddRfTz8Z0YhujW4CeFz1AEQdSwQqS3SOlhnBHG
	NhTuXd5YM5d29HuIThJ8i6TvZTku3LJwXB0sJOyXHdt05rzDQo7837Azv1ilysMq1A720dMrfSU
	UPPnJ4/pW+gl0Broj2HNFJg/wziucfHQBaV8SIlLILA8Atb6sfbNhIJZXei8EfPBez9nnjeE7VN
	BBV0TlvT868zGyk06gK9pmIpxL1PCZUxt2Nyj3/ToB5E+UC4m8LqO4f7DyKBkgQbVgDm874084y
	r13/0cunJJMeyvOGN2tEBPUhjuKez9+0nL81jv9w4rJPYdVst1vbsbQA9BNyQQIZ3bnWc+WohwA
	eWgEdzQs6ZYZ5CYPNavedk2MEtUfVKFM+DrMlIQ8UZO0SItK2M41aiU=
X-Received: by 2002:a17:90b:3a0e:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b182e107dcmr3006901a91.7.1794423870904;
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:30 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:03:58 -0300
Subject: [PATCH v2 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power
 regulator
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-2-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=1776;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=G0D3AUMCZAfAB+oBMBn/hQwsHUHoV16Fn9kK3ypcWVo=;
 b=nVAd3ioHTSP14EpXIOGgXQEKXYdlaDj7tVEwROvBxWF3/+gClQ12Rlidq7vEtLB+ule4J4Vk0
 3bR2zBAFxnoCkRzAHzkq5qgKAg20KQVSPt5/X9Lvj3yCeW7DLsd4Jni
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 6ef2a986ca8cd..73e3b99486d0e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index 6b5393accc092..6fb57935cdf1f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {

-- 
2.43.0

