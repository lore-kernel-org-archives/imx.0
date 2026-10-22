Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677780;
	b=TwygjYM86rA7TWHv3e0EPtGoAyy4/d8FeSUddWqk2GhNTlUzz/UpiKiG26lLs4k1YxfJ
	 twMLGyHlzsckWwxCJmy5BRN0tAw1fW4rphVomRl4SvqvjzyJgXV/5yEQMCBt5iSCDbIzO
	 9qH1qwG05bf2OXJyxJba8ipt5cc3O0uprQ8rtzzKtUabZps+LlfZcXtPKjZBVi7mLGXJF
	 uBm9vUsAbBIOqwqHWeClLQEdk2bUv5TATdWNqt4jW8LEx9aJGa0R45aAjUE8XGzEODc5z
	 G4/dFTXDk1y79fde/RoPYU3DEqGE9c0T4W6MSMPQuftvIXtxwv6MtCSutAwvC/1YxPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677780;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
	b=m1/a/JKhds99h4JiKTAnao+rQ/a0tXqmZg8y3Igaf2gMzUY1aIBBHuWvK/6sPzYpg4J1
	 HXAjXd1n1tGZlBWqlNtkpxt7a+RzH6Xljqxqej3xQ7JNs8Lf1mlN2klGQXV6p6YBhFa3v
	 O38AAECeI3I+GkarUDQ72fvLb9cBtMz99Dhp252rZT55wfyPWp3wzoqB396tPqFFFBuqQ
	 atjZiSqw+4DfutmC+dx5/3tsa//5dPq/7l4k2ilRYzYpRoPNmubDmfjN5J975qrWDeG48
	 OAkCWL7yXU1R0oiSaPrMoDZU9XCBC5na3E0kpGDexU9RYU1zsOEyLL1pJUkTB4wisvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=konsulko.com;
	spf=pass smtp.mailfrom=konsulko.com;
	dkim=pass header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=UOTp4EH3;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF42606A328
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF42606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=konsulko.com header.i=@konsulko.com header.a=rsa-sha256 header.s=google header.b=UOTp4EH3
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a20e5628f2so807445e9.2
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792677778; x=1793282578; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=UOTp4EH351kIHebyLer5vEMvKE/EUro+gjFYWT/nuhFQEV/Hv4BT2jIDUbXiKiuXRM
         X/n8T1CQqGr13j3k6xEt3nfjRzYys0ptSEnrBE9/K3SJPifE/ozAM2kYQRmpfGuAvTd7
         WWR9miDlI3A65s+PQAMwu1DNNxUJcP60VDuMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677778; x=1793282578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=iNOWelVfJ2dudIJTPNMDbdD1eB2J+ookSdoNgFev95h4pDjaF8QusFjjXmczbwdvcf
         4v3qKYNgX7YvIxwbPwBy1owLqxTVKLk9UoHjmRMdNXGFlHbOfAYIkv4zS6fEdOPG3UgZ
         5fKjh3N6oS/pgShayCbd/vjhiYbkoNxcesBtzeH4ck8znhei0Orpfsa9DV1o/vPjriFo
         PSW66pz8wOL1O/LYLxNd1/YCa+P/a8J9zaeTacfqDBXNXnsiY8V+bBxN4jMiCr4EIUim
         6xdwAptsVdr068YD8EBC0eHtVTH5Lg6IJHEO4WB9hRk5NA6EhamRJuEQClXhrsom2Z6i
         4KLw==
X-Forwarded-Encrypted: i=1; AKwUvBx3ZYV3+dKYUAqPdHc5MEvJ75SL7e5tRwKtYtui4+inAqvKqDFZp8n+bq7eSiKpB8/EsP0=@lists.linux.dev
X-Gm-Message-State: AFq9FYLQnkNxMEPuoeaDs8QfiMeSsO4Jp/wFn52be6kBwnRetlOQb3vc
	q+9GMfSwkPXv/jX9XIGQPtqK2D8ab//RFe6ybUOJdRb9V4E6vYt3ReLyCCe6Mecbecc=
X-Gm-Gg: AYBFou2WAI2EOYLg74RkE/owwvymmV7YWKb5Oev62fFB8Fq12+gtOV6Rh87Uk9Ysdx0
	Be8pyM998nTDVCHn8zLV9Mms7Vr4ZjtuFr1YNGq+ikSWw0/E/QSWDCKcsmJ9dDunHrqnJdIrANd
	Ng9dESiHwN17WisL3W0yIdnKpTqbgFQ0tXQFrtavwPhasQSm3KutyzOIqmof3Ss438LWAoZ+CFx
	4mLuqipArmXP5ATu072swhEbZ9yslVrkV010C8KhZJMgfApvtOqrOJGwv4vOp5EOkfYc6oj9hXu
	nQwijxJaDMuj2ZM9SpUzHllKAiVAj/TN8dhue9TWj5IMJpDW8rrP/GEE5DskuLb+2o4g4akvJcp
	PaktWj58yNMeTFdwUYH3MHj59F/omrjDuANd1wjoekjBESvQ23FWXf/CG8gzoFI+5SYC1DNvDeJ
	8UlRJVcBM6vQy+Cz8r9OC2fP+iiLxtivePWKEtn64yqeAVwqNRotf8mPJndjtsp3C5648cxQvGK
	XlyNje0Ge/FDJl5AD3eCLBUcZWZKLKth/y81/NN/Lz/36dh0XH5qGS2+hM30Eq/VIMkgQEW
X-Received: by 2002:a05:600c:8b43:b0:4a2:a9:ed5a with SMTP id 5b1f17b1804b1-4a200a9ef31mr92100115e9.8.1792677778171;
        Thu, 22 Oct 2026 07:02:58 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2582a53fsm12538258f8f.32.2026.10.22.07.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:02:57 -0700 (PDT)
From: Petko Manolov <petko.manolov@konsulko.com>
To: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	arnemaximilian.richter@draeger.com,
	martynas.grybauskas@draeger.com,
	Petko Manolov <petko.manolov@konsulko.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Thu, 22 Oct 2026 17:02:42 +0300
Message-ID: <20261022140244.3476844-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022140244.3476844-1-petko.manolov@konsulko.com>
References: <20261022140244.3476844-1-petko.manolov@konsulko.com>
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

M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other.  One of them is
imx6, the other is Altera SoCFPGA Cyclone 5.  The latter is booting
independently off qspi.

The imx6 parts that are used in M48 are imx6q and imx6dl, hence the
two bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Petko Manolov <petko.manolov@konsulko.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..8f3a04228780 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -260,6 +260,7 @@ properties:
               - boundary,imx6q-nitrogen6x
               - compulab,cm-fx6           # CompuLab CM-FX6
               - dmo,imx6q-edmqmx6         # Data Modul eDM-QMX6 Board
+              - draeger,imx6q-m48         # Draeger imx6q variant of M48
               - ds,imx6q-sbc              # Da Sheng COM-9XX Modules
               - embest,imx6q-marsboard    # Embest MarS Board i.MX6Dual
               - emtrion,emcon-mx6         # emCON-MX6D or emCON-MX6Q SoM
@@ -458,6 +459,7 @@ properties:
               - boundary,imx6dl-nit6xlite     # Boundary Devices Nitrogen6 Lite
               - boundary,imx6dl-nitrogen6x    # Boundary Devices Nitrogen6x
               - bticino,imx6dl-mamoj      # BTicino i.MX6DL Mamoj
+              - draeger,imx6dl-m48        # Draeger imx6dl variant of M48
               - eckelmann,imx6dl-ci4x10
               - emtrion,emcon-mx6         # emCON-MX6S or emCON-MX6DL SoM
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
-- 
2.47.3

