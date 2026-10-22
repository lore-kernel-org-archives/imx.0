Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=beeUmg0CP9pCXu4cQdpmTPO1U3STqtWCjx27jfoJ5WPtszx8OgFWu0fFSF7oqCFUg1JZ
	 K9IcW7qEI4XWzVpaCqT/iREBolXltMKSKGGWwJ5nBSYS4zHpkRafct1E2N4p/WPsoWOai
	 DPYoQ8CD4XFfpHlQ4If6ynWaNwqjS7kKJqPwT5CszzHB3u3FtsyAGIOmkgsb7ABiVFKs+
	 LlvH6GwdY7Qf7yDLaLxdKxbyFYSCShgzen96/sfp34hMz7pwgMC6OtC3TU4bpqjpvwOgG
	 DL3DxVmmWitS8vgDkvkj4DUw1SGEmxOiG1cMjhYJSUPfQ7mud/DVITi32EZ92uHeu0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
	b=DeJ8OefRhSCB3knFmGsnerFbVNp+c3sjEHN7SpNWnvYGxBPbqPXw4yncuv4pjMGIYblP
	 6zhEl7FOjWz/nNlKHPjKuU7LTExffztE9WeqY6aHuxIsy4bPrOF9Vv9Mt9Z0yhW89B7My
	 g2eSiAmR8Yjl8Uqv6AEZMh2rKF8U2og9R1UFOm9+AvQB4d0MZpzxijVhb5WPegAxseTz5
	 LJRMkm5hhBVBS+KhJKQkJeWnqknKtNmluND8ElA+JyBbUZH1B2wtDFuUoI+9rBvhQy/w6
	 1NN7evza1Aikd8VqFvqwBnUiC8DrLtCKBZCiUYDV/Ed7GH8QvtFBiQHAtU/E1OZFbig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRWA58JP;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85329606A324
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85329606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gRWA58JP
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48df54150dfso1264891f8f.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680411; x=1793285211; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=gRWA58JPBR09EehgIezOk1lDhcVaOBZLtI6duytmP9Aa4dc7n3M0IWCJBnv3dyhsYU
         SR5hD56R2Im1mfG9dtC+UY8Cv6rAeoxdu1g8ut61yC4BPi65xbSrLwnIevbM1KDN1zOu
         U+/PgD/31f/nVQ1wGyHUHhie3Q/7yqiADRfPOAQxYpa6tXg5V74VoxcE6HBWQ4aASVTU
         jaip3cg8Fei5tM297BnOJiN1QhjIkbMK9i8wWiLZNwF+qm/mhbTLB/tpPN0l7Lsm6fkg
         8Bn3AFk3vyiYMiS1kBvtzWb/7GQpn7VlG2P0SCG5NCUgl16DskeR7MShmPXOWHDn5Lpz
         aPeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680411; x=1793285211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=HJeLD171T1Rw0EE5Dd7NAxVyYUYIx3Up9mCBFL8NeViiaYss3aeRDzOcfJxtVHucnt
         xZLCkirT+FKRTdrkqabZ/c23bXCr6vwQO6Gr8qAwSG268N1UXLk3zzDyvEivkFslUy7X
         EapAGFTWGlccAcShzRnpK3hgsNFlhnuQ6z6skNbqsaEFDHF3lVbxhEyoMBsdLsNqQcSR
         JvCENUGuTaFkex0K3QTVCYeD3jpxufzg2L1pvkBC2nQDxlwwMIDiWMiy1Kz2pjJTaWzw
         Djsu3GYZZVumq7Z7pyZu4sR9CqRcmp4kzrz2cE0vA16mbMiCMD29uSCpgQTsHL+5I3S8
         1hSw==
X-Forwarded-Encrypted: i=1; AKwUvBz5Qx4wvWFwhskYkrrOWRRKWmyZhT+D7kXxP9k0Tp2nsIViYEPpraipdTpJOf0UfZK8+Q4=@lists.linux.dev
X-Gm-Message-State: AFq9FYJlymbM9iqK0cCBwJuIvFZl6PDgujU2hPrPJd1QLs148JiuNbVY
	H3TVmO1X+OUPJbL7S1eBT/esVL80ZkyBee77UScAEQChQAkT9SiFw2ec
X-Gm-Gg: AYBFou0GjVpR7UW2DrMrP5b+nAuojatU3WaBB4hjiYOB0GGvMZphhsqpdwy3OsN3mUs
	pjspAkEGwHMweOFrVO/9slz/vIn9c0riEFyZ5r/uCoa4z/lgQ3PDxijI6Rq04rDNp6LUHsmweVA
	z+8ObzZPCnTfzBV9ZheazFxSqaWpJoiWUk3IH3RhEymCHWkXV/tnmHCgCkU05k+DhfWM/aT+gYa
	+go+2RQNkhv2AjSFA6123o2YvoDJ1apCbwZAeObx0d179k5V1LGQ65PBb5B1J+Q3yeUq6H72Fi7
	BS4ldwDxQXlMu2xblCt8EjibMcxvc0aKthSsuvrF3350Qiz+tj9boNPlPT19MlJzxLHQVOgRDc0
	bJXBj5VI1v7IcvycC0sNaWSDytZ9x/5oK5x63Wj/e3bDs3LUOclOoI0Xe+Q/wOpSCzFtJd9MPc1
	YWZdZSOTPYZA0KUyDbHbblIlo9nv7tDk6HGAx6dAuP7cmsHeqBZgrBDzk3+gpi6LTwgU8f8YRSl
	Znys7C/nqWLgQEDe1iIKc+ldKZByILRwvT/49Aajimx7Xak1Rx27SGv9batjWKdxdcOrw9I9yFQ
	LXXsdB/N65acvrZoqXUrUrqrpeEM0t6wDWzsSPNuSaFawBNLzUqjEogKEP3Ceh7hTxk9b4FdLdv
	Q
X-Received: by 2002:a05:6000:2c0d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-48e2644f155mr11067241f8f.4.1792680410751;
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:44 +0200
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
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
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-1-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0

