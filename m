Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03204EBADA
	for <imx@lists.linux.dev>; Tue, 29 Sep 2026 09:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790673515; cv=none; b=c4h/tM6QGcPft0HDrzXhfol5Zgms07s8Hido1Vg3jFTxmg132oJsyIvslhQSsbTwzuOIpQsXtb3+CD/rDw8hixD5YfA0U5Lcf3roVjhNZ4WvnbnuhY8VlxRGL6NOhlJG5xppgllbzP1G04IHKv2hlHft76BQanp4SxXHFv8/JL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790673515; c=relaxed/simple;
	bh=ri0EKLCo9ykbHgtbxMCU2oFNY7ARzNutsXrI2nPbGwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G5KhuREhUA88mFnAm/pJdhuAs+uDbGX9Y4j9y222dx65WhnPnyUOd/6vJSGjRW/M6RwcH4m/qxfBFQo9jmiXQYyGvLMLfpx5XrMdAnm011PAFkHLpYpLHGUb4mPq6FtoU/CHSg98tRGfUXWV1EWCYBRqmfHSnVQsnnWzpEzc0sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com; spf=pass smtp.mailfrom=konsulko.com; dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b=b+k3vW++; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=konsulko.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=konsulko.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=konsulko.com header.i=@konsulko.com header.b="b+k3vW++"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so17216985e9.1
        for <imx@lists.linux.dev>; Tue, 29 Sep 2026 02:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1790673502; x=1791278302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=b+k3vW++2lzFsDoHOC1PotNPuHz1GVomE16MrOkqzojsdgxCcQENX8E12/tPpvmTyY
         y9347txBTIC+Ha0UHvYlMXyRh7TyCEzSSRDHHmolfiTBLqUAEkHjkpyMbb/wfbAqotJd
         TAduJ9Zq8FYWJS5J0IVysiisCzh8C9qrvI/xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790673502; x=1791278302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=unFYBtTqlVT6bN2FF4/L03Y0XFidsVEHfAKhYHlLoKo=;
        b=TnMFNKHL5IBWJWOqoGlhhpaVwczs7U8QL+LOZ7ogzlNhlkj24lkPv2urJtTzBcDSMM
         lTIwsAN56GFiKF8rBflg7TdKBBaDJnBxkn7mU40OK7hifdSSBukFiwsv2wIbJFvfAvX8
         qd0cY7B6lCGYsW+MywwAqSQ23KyOaeIKyMMEAqVvW4/TU2K/e1PjkAGkoL/pP2Uvw2ml
         PiwiL+iEfS30dve6UnJwU9sJESirB0Eb5d5jpaRwwe2anwewMX9VwS574aBaZ0+inxbj
         ZXSSww6gpAcUfktSxkbM1HRS38zZ65mEEntqsO8MdW9FbJJIrof2CwIv+7poKpyEVoyL
         PfhA==
X-Forwarded-Encrypted: i=1; AKwUvBwVuQe1TLKxNR1LyJ5Igzbtv+Jc8esWOWS1I3Ii/qMBM3QkaYdbLYrsi4hU9BQmyIDfw/Y=@lists.linux.dev
X-Gm-Message-State: AFuF++nrOuinvbZYFwWZQsJlLEDgt/mby57yGWv5Bn83qYJU5UUxJPfp
	6ZGk0xgYfe4iOdDl/bboJLMtHgoKTIUxzKcKH7lWOL+N5VhTRPLdLFiXncw374hNpdA=
X-Gm-Gg: AYBFou2bPcr3H51vWT7ICre2QmtIYSFKqTEauAnFIDVLjhBSGpwBAuizyoxo6jSixDZ
	dzBFs3Ft6Z66lNn5WMZPsjRi9xhxjkLrSeT4crKmHb0zQGOjOr2XfbJnHLj/LIErNDItDIkCdAk
	gcHdP0ev2gu4N1Ve7yIVsLio8Osu90gQIx44BMjMJTDWS1FgtdI9sixY22aCezE0QGS3JHGq/P+
	4JvupF4Vh3lBkAdoo+neTn20fzaA46R187c8W2zzktwvSFWa/jppiDucrxGAtKh/OSA85rCUkXp
	p2U531ac94rZ+H5KoHFB/E4fBPwjxwiEdekwm4tBCZBv7vXGcON1qmEOJzdqYu+19wtEW/ProIQ
	BAWgVo+cfb0+d4OVIwMylcgQ+RYgNf1JOVrXzIgQxCFiUa269tB+COthoUHZ5/yQ4Q8jlfCty4/
	asTqvobQqu9tLP4FsCwJBg2JTCE8lQ7DjTm2k/SdE4sGXs9wSIRexEwZ3Nya85QvpnhVNo5ZyuH
	L096ygwiIA/upI=
X-Received: by 2002:a05:600c:348e:b0:49e:8191:e5cb with SMTP id 5b1f17b1804b1-49ff06b2ef6mr212016085e9.5.1790673502310;
        Tue, 29 Sep 2026 02:18:22 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf9b150sm59178575e9.7.2026.09.29.02.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 02:18:21 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: add Draeger M48 dual-cpu board
Date: Tue, 29 Sep 2026 12:18:09 +0300
Message-ID: <20260929091811.3735201-2-petko.manolov@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929091811.3735201-1-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
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

