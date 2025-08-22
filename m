Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05D526D4CE
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869488; cv=none; b=pRfbc7NORxxibTAS4T6KQaue3wBKd5TQD2X6cDDH2raWspH6Y548VDXcQgRW8kwb+q5p3WmvdgGl89at+0GkWSisjSbkgglDsb3p84o4wOv22Cb/cggBUz1a1WIghx5/+DIjKBeILUMBPi5/cpgdpkVqZ1pz9saCq5wlV5hXt7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869488; c=relaxed/simple;
	bh=qJdqhbannqpcNe/ZF5YUjLIXi50NcD/YKBgc5cMgrCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=brPHGJEbONX9gSwy/hxM+DbgQBKmBJr86+7DDbScuoZZD7k8946V2Sc7BLdz/RR3YyL4T1hAZL0+oefIRmVFPOqxDQBU6AVyXZVN5BzXSGHZ/GA7wB1PoULA3CpSP9D0oqJ7hc2XQNx+VJBV2BKiczx2F//71FJ2R4ks225rV44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h3qtqKEd; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h3qtqKEd"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afdf4bb0e5cso31552466b.2
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869485; x=1756474285; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UPjWI7EHXybjCjXrMdkmBIb5D7sVI/NhlSvf78izrHE=;
        b=h3qtqKEdvXk3X/bs4n6MDOu4d4TS8mAOZUm8dk0AasaovmfFLSnW78WgkIJU+TVGNH
         tTpVISrDpe1kPGAbngEBhSC8v1Gh+OaAFLV1Waj8WZFVCAhrr8Xax2NdBB8PysxZXjgq
         4K3qRE2ubj0hRYl82Z0s+ZN4D2iQvEUFqle1DDwmsSmk4tmO7TaD33JMRokBMGNGJuyf
         HCnYeJ8ok8a1GY5NS1KWrxAq0hOZ3QPcgyz3igra16xHFFK7dUTbfCTOZ96zRXbf6bVi
         xa+Fd92bZ9a99KBndaVNVc2AEyR9mijA3/UbO8pLMdyhbU62qm0iioNw6e2xQUhen3xr
         CFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869485; x=1756474285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPjWI7EHXybjCjXrMdkmBIb5D7sVI/NhlSvf78izrHE=;
        b=hGa/PlCgGHWLGbVoK0ZVSf+HREtQyLbg6mZGAUAXDoO4gvoTnRjOybu1n2tPLD+poq
         fKmMIQa6C6dQ9e1Rz/+BIqBR/G4Mg0O9pQidqpqeV8etyJUggH9vyugI6N0XdwiRP4K3
         ieyIeT64P+7XRq9inBIt7r8+TRqxXj3IMr7O88/+/tV96qWX7dMDgVw8iumaRrYoJAc6
         gNuI/zu+Dkg4IarcjTbx+46hXV34RuCxRq2tjpMMT3WTGO4FrYO9iDnEcl3DrZ7MMx5J
         fwI+bX8rZ3LUrQcPaxK/RFVIZYLbxQ2/8okDMOp3GK3burw8FwKL8lQHTKDTR1angPqx
         i2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSV4hue+vfM3nt+idUK1wg6kkVOTG90MK4Er3DnakIanSdIV3pdmNBJrcDmRvG6BAat64=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy40sPXUmoXtE9f1Nal1ZwX7/KSQiPTQVhC1prBqIC/ZRWTj07
	cQCIeYJ4nkk8lAO6F2do1jD+zfbfamoKKNynhuG0s66A4qLhyZQZMPnVYvb7yTbdwxQ=
X-Gm-Gg: ASbGnctcFzE9wKDYNCg40MUHtybcP0+9HGbh3ADBWnZBnzyNtQ74LFVxnAcCcJlNlB/
	fWfCvvEC5kC8O1TyEd18lsGf921Q08qJ8IM8Vdfu8rNc9pzoz16Aw115GQeJXWuo4sr/Gq5E96K
	Se1kMS4aHERPBw6CMWrqsm+leorxro/jgiBrMeQw35Pm7oNMJm+K7jfJdtnS6ab5A78C9PiW2u3
	OHwighFt1VR7KCClXkeeP439iKsVkKAGD9K+usIoLzF7U0k2TWketG9dm/qdl1wScm1k+Rw5kKQ
	eMM+/GVn41shedsYaku0j2pc68J4VCMGR71iUaA7tSrwF9JZGOjhzEtum/7touhESyme42LEDEo
	IH1JtySLRNJQ6FjVsum8q44Vkh8r0vERVfTYxMD4=
X-Google-Smtp-Source: AGHT+IFNlJzZkDjLydkUzPUYLlA2c9JWh9TESZKV4zpfAYn8jjKMtO3j/MHwJN4CO/OBrA5y4xzAzQ==
X-Received: by 2002:a17:907:2da9:b0:af9:649c:d0ae with SMTP id a640c23a62f3a-afe294b454fmr144101566b.8.1755869485266;
        Fri, 22 Aug 2025 06:31:25 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:11 +0200
Subject: [PATCH 02/10] arm64: dts: fsl-ls1043a: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-2-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1349;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qJdqhbannqpcNe/ZF5YUjLIXi50NcD/YKBgc5cMgrCM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEgGG8Ahoy4wxm6xwMlRb9HztC+05u5oiGkT
 kxjGtiUVeSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIAAKCRDBN2bmhouD
 18B8D/9OaqPF1Mfs2Ufem0YAlsIQ5SlbHEwLAzxREncxYfZL8LpWvL5GA2B3aULGUmLI4k3HVBU
 XYr16qUJN2hSlRM5e07nlfHYNM/IsvAgif+INe8YNODi+pBIOvo5FpsWFR6nCSGEMPyqHDA5732
 bY+iUCrPIadFPGVQxHCuRvsovQFP2oDHuB5rzAPO6vlYABNqA9l+UC4n+MqEEa3S/sQCAhwO1dX
 D/QSwxXAKw6xOzZkp8gwxvxuuxeQwnbGD87eUuMNW/JLQg549HY4jQlWaNKvix4UJgnhqfIK+p/
 E02HY+5e/wOS4958yv2SFIjXt14YHFcCRlgvRWeeCQcy3Q9BSSIIP6NBa2GYeuYElQmnpgP6Ei0
 WltvDg3oBZIkReUE1fZNCQsITc7R8vZw+i1+tX/Yk1IGzQgYAFvB4xMzPrBJK0WZcoTB4nH/GT1
 +a0pidmbdqbT/MVM3PYYk+n+JmvvrpabaTXa72ubWo4vK0wicl1Gmx9Zukc7eXfrrNKGOC8OrmA
 zWBNin+TdD9T8yH5rrVGH2A7HuJj47d7aPoGJD4EVNgfGex/Xi7nQuf2YCZbFchzQVsVFDTjpaQ
 JOlfvddfcs2Pek3McvvhumLNXxH0VGtEQqOH1aO0QIsM8qkFThGIK80ReiXtGWPzLsX+zoRXG/r
 d4IQ0px1to6syqw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1043a.dtsi:330.5-342.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 26bea88cb967ccdb7b3cbae3191476f486c86288..73315c51703943d9ee5e1aa300c388ff6482423f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -289,6 +289,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1401000 0 0x1000>, /* GICD */

-- 
2.48.1

