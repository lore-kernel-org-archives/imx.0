Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793572346;
	b=y8xZ4ZmSH6Dbu4NfOgJdycUZQWR9JZoHF4/l7ro9cakMUJ5bikQBFkc5HVg+00CFhbj6
	 RlycXboFpAGTCsXtOLo75vUJA5UDdhfwCJmues0O8utlu9FEqaJcVRwhtL5VQl5WirAnw
	 xFbqztV0RqHRROpd2sBCQbXXcFF1ck7mWzbCfhWnWFUifKldsi8hJmupC9fK5xTLqagnN
	 DzxIqNtzZgiV8UQ1EgdaUgeOHX3LHnca8wzf9QNIh1c1Ygx0PqUMEchrHgqVzqpK57EPw
	 mnFLDqycva9FI2mtNce9fcoNQem83jw6v3AusLxRLPBSb+OBJprpo3oJ8CfRLQY4vmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793572346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
	b=hIUrfw+x5NnkyTLEFJZtgHwVLslCuOGKMxkrsFPVcl2M0ymVfcF4NUUz77uhFuqeZwC2
	 ZNGs8bFMKYR7ZSw1Rny/aKvb8iXuWzttJYeXSuTw2bNhGHGnZd5GpzNScPo1H7r3akxJi
	 8lV65tzBSMi9hFwNG1h//G9GonJW8YGnxwWVgrfomItU7Wfi7cDFC/TiNFOoQcRJWVFBD
	 Um+dAXiNpecRq7hsPPrD2+cytNCHDdYNyj8zHf/UJYrlQyubIoAfT3byBbnH7JwhH4R7k
	 4NKQJx4XmK6fnsEst4jucakFp8kuFjbQBWAJSzqmGKgCx+82USeMsw/8awokuFhCPrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwsFe3r3;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26B860A260C
	for <imx@lists.linux.dev>; Sun,  1 Nov 2026 22:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A26B860A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gwsFe3r3
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e0d1da913so1766072f8f.1
        for <imx@lists.linux.dev>; Sun, 01 Nov 2026 14:32:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793572344; x=1794177144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=gwsFe3r31enuV1P0KLv63JVklkAJ7LlDzgsOBehy5d9WnZKUWpdeY8g3Y8LhUsmC/7
         bBWnqCtUEwQCuuMoYPJEkd4877mVE/ScjI306KbqJ1eaXZIDXPbNvlfnVqTMnOYJe2Dv
         v0IZmlhJAaZ12K0iO5RG7A19SOAg83wPVC/ybX4hb0YSWq8DNUonQissRa5YK156anZx
         qGoHEVXDBya9VKQ1+C0lqId+xm4BTYPgLxVzLzbgIJMGtgQi+/KM0oTL3Z2EbnPcrQW6
         YynTFI9a8FI4SiB1iGFjdZqmwVcQ1bhN2AdWeHmgYiuioYg08zny1B+C067Jq45kd5tc
         3wcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793572344; x=1794177144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XRvRDso/7nPZytfvh9i/Caaj8XKSnRZSw/8wKdSxLLI=;
        b=AVLXBzp2s64g4j7q+nI9nhx9Gu1f3GV4kvj0PaGjmQA1NakTA7XSXg2muRWygPSb3g
         ahHhdc/gDJSOwHr5/rMujWAUfAqUCGZqrv2/DIFUcsm1MLSOHiqciRrvnGcIQ9yuUGTw
         h7qBaWsFEVS9GtUYZLA2VHT57BpPt1C0G4u/X+v8lCSSj2TyydnpB0F/BVYQPK+4Qetb
         W3Xvv4RjZUw8Ozo/L33UJNjgJlaq+x6GbMsF7qxhwhOyUZrTEmnbht20wCbzH52oYhVf
         fxHFHBWPV24A2XRNS79elFFAFJ+wCbNnZ10VMGhc5u9C3x9p2biAUNDx8pfAysj33pRJ
         5orA==
X-Forwarded-Encrypted: i=1; AKwUvByzunvuAfhUjk/1ol+SdO3H6THbi/yyHPtuVebeZOrRuQhLRgoYwoCAnDs4NI4vGNkYBSw=@lists.linux.dev
X-Gm-Message-State: APuU4Z+IGvYa3vLnBrk78jm7ICkk3q9yW1K8/R1UO5LYUOeL1J+JILTn
	ruqs9D0gUGg4cKOaelrptF0u7AgVYa5CnonyBkQYoJTzs82zfqn8FrOa
X-Gm-Gg: AYBFou1e6KSCBJefzTLv5TzFULs2dibtu1eGHaXpNHFntle+uPSt1+aptVzPmcYO6hX
	lSfz7RdxWe1DHDXeuRJxj7/WQUJ1QpQGIdFYqidiRH5zgZIrK1790Fyyzt163aboMMHj7QuG67J
	O0LFjsVFLAhjzVjRYQIKef/Gtm1PkYWBsAi66BIOcmPtqZRmBCMWEBFPi+mQGYGlaC/JvekIBuw
	ypLbX5gqMoEMw2lCfj9fsYHLFxbsBPI47RO1yUYma8uOPALdcW3IagpMpcAsYWW5Ug7b2Lrz0N4
	1sQl2tG/q2PcIbjZRT/e0U+zfpP6Zn5jlEdMCS6F4unxDfqHtc5h1w0H3L13clgbRHDo1ly4Byc
	tSv5W9zoM5abx/Z3QW1z/hWsjvu/le7IJnmeMV2wQwsq7jxiTHrtynVFO/mmEuMOdEH5LpRTyay
	9OxKJMBTUjCa5ZGqRlWlWtlvzCcBirBGhPZRy97+Rib9ZUpXfGTxZio2U97kQn6/f7SaPcLl8V3
	eFg0pXrJSty4s7uTJmec4ubPJ/bmZ7TvvVVSRqI9ETppuIwU32YlmG+eLOwiyDs0PUlBzPttvZa
	47HmKYL4g1Lz4PCr8PzEwXE44jwPv8xyzYfXAmwc+MElhDZbBNupXej2hrBxNLHu7WWCfK0DmqU
	wD3xaq8YnsA==
X-Received: by 2002:a5d:6308:0:b0:48e:884:affb with SMTP id ffacd0b85a97d-48e64cd42famr20330228f8f.24.1793572344037;
        Sun, 01 Nov 2026 14:32:24 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78f95sm14904805f8f.28.2026.11.01.14.32.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:32:22 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD option
Date: Sun,  1 Nov 2026 22:31:25 +0000
Message-ID: <20261101223125.302001-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101223125.302001-1-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
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

The SY7636A is no longer bound through an MFD.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index ed588add8d31..f02b5605e533 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -239,7 +239,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

