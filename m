Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7804446F7
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 11:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789385712; cv=none; b=u5zTXODDztQG4ehQpQErU1+c/QjYl03KphYPbLRiSl0+mBZ1ziY5CwhuekCjkJ7PoQaakh+uncIFTDVhXy9DklBvDKPzABUnuGNgON7umi+ZAHV+dVDP9cy7VJMxiACsWzLQ0sw5cRFG2X0H7/U8zSujf/0vOywA4Fgonc2uA+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789385712; c=relaxed/simple;
	bh=2tYt6Xz3Ww2Nu03hw+VbVfk++p/qUxznZgUfL+6yi/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GE1UKorU1FFdXY+YMui16g6l8zg72K7YiDZGwO+K6dAO13pPe6MAOE5IeaEc8pUtmYKZLFhoh5+ufk2vugNuEjhWWsZAvCmFIPC4KZy16cTcq/w7JctUDt2aeQ8FLJYxlQFlzMGtH/Zj2/V3r/bUlmUhrCBB7VTjIEvLhfU2ZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R4ipnQR1; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R4ipnQR1"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633cd80so766559f8f.2
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 04:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789385709; x=1789990509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=R4ipnQR1BYqxySjgbr4+bauXZHYKMr23Ewih41bztw7/DdaVYor/OSwxS/+w0wjjbS
         VTv4lQx5sy7tp1vvvqrN2lmIydo7PBSHPYpYP4dSrtRMvYoZ9AxCJqeHpu2cEdZHIcCs
         Vs9sQ4y6OlMR6gIKvBEQQvbRW6Vbh28b5qZFpgfoPQCQhWLNiI8khDRmpSSmdyNHAqQp
         HlCj+4drLwickjW5fW/ynta0j3K1+3237bnahljNq1n1iC69INiMwjcfa/1d8/iioZbg
         RaBeFSQ+ZDJ89142WpsiWErRYvNLe49a525iqkOoxSFjMz6OCBUE9a6sUn0jDZ7TS6U1
         wnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789385709; x=1789990509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIkGfv940lwcDRBFVlKYwWw1ZND7s87QEgBkPEkik3A=;
        b=ENIdxgl0pG9ItpFIp9lr6zLqNXTCJemWPkL1gKRWMQY0wePGTLTvInZFB4tTXJp8Y8
         qTdFBBINA9rbmegcVAcohKMnDTpsGgkRCbKs8kz5q9g5fwP+jV2pTKxV/MRbztwfacmy
         Q4xxZDvTUHojQqefO/7yLhnoeBxXM4LqSuUvAiZo16J2rswZSm56WOwt8gcmjKGfJR+z
         vd6iMthduOHIDAY+SDSuthJnf7gh8mPh9RFe0WwztjzigwiK3BNd1qEmmGKpz2q6GtXZ
         mSflzU7R0uo46BrfIyJ+4+BPtwy2tqsU5bwNK4izIvQoEushomVuDssKxWCFPOVsNYOI
         4I6w==
X-Forwarded-Encrypted: i=1; AKwUvBycm5rSCePvrATsn3saMCCMOEUaK8aEPqu6UWJLAgD/BJNy8fxG982tPWYCZHEVRmcTtoM=@lists.linux.dev
X-Gm-Message-State: AFuF++nq+37m2ctvP0fp2PXXCLGMAGhtJNTSKKUT+INTS13vqh3RvggY
	PI58fUR9Cw9E9BALV//zmfITxGiYDgJdy0S9R+sibr4JjSfKqPDQdRMp
X-Gm-Gg: AYBFou3AMNJeSKFPqDtreH6AsTy3NKUk7A5mkCwnYrRArrZG2YHsEZ/9RAEjhZmDKiV
	wUTNkmIO/iWyD/833TGJeA+i/RiXODzSnN8z8KTGyy0MPU4LS0dyMNeQh7K3r+VtxMncE4oIxWy
	cHpnYSfeqD9DChIITXBkmo1x11SPhMKOg1D3fdL8u8RsXyzWBgAyucOvRejHq7MoTK2OX2eKJ68
	AUc00elk0EHPWh9dkD6MrV3aC1OeLmJYVyGC8debtk1sFgfRUNuq/gHZOTc8pC/9C9uP/5+IUGB
	w6KZPgY8avq7r5eNN3mb1zz+7wDXOH6fM2k2RBxkpOpQcNWYIoaAwfe3IQNWgwIXh45lvdTYBt7
	7yXn00t41smfiYAPzBuootgjdCONdeaPjE3hRFpXTMJ3NcxKjuour8oUBCLXSAfwWoIT4qoWl0J
	nkqLxdnP14JNwsTW2EE8MZnOyBLbTMghEAZ/0hQ1DKV7bXfcAAEwL1+JA0Ukjzn2zQ/RRf8eBa+
	BLHp/YRDpxcsnYk9+rsueD5vw==
X-Received: by 2002:a05:6000:2891:b0:486:f780:9be7 with SMTP id ffacd0b85a97d-48702ae4dd3mr2401139f8f.3.1789385709124;
        Mon, 14 Sep 2026 04:35:09 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm27906531f8f.37.2026.09.14.04.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:35:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
Date: Mon, 14 Sep 2026 04:30:09 -0700
Message-ID: <20260914113010.988-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT compatible string for the MR-NAVQ95 board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 338dd9eafb17..c91ae3ab7cd1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1536,6 +1536,7 @@ properties:
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
               - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
               - fsl,imx95-19x19-frdm-pro  # i.MX95 19x19 FRDM PRO Board
+              - fsl,imx95-navq            # MR-NAVQ95 board
               - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
           - const: fsl,imx95
 
-- 
2.53.0

