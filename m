Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595002;
	b=RIgU0m8XAfbNFHw/uZNk6WYvNkleTMitEBBgTQBT6m9gR+e06VwGDbhjDDpuJjuAP4ZA
	 4Xiwr+yJD7uxiKJMu8zsVDIbsbirFd3ZSnmkhN4Lm0v4UUF7+349kCYlohZtva6wdMnnw
	 henRBP05gHX7n3FhFYfGQnVMO1GXfce2ZbS61zdE8i+mFcqw21u/Lglx4WUrvNzPGgqZ6
	 7x+2zkhIbvsKwjP0s6hwG7HtCBzNoarwovNIgAZED/Ft4fr2T/9cFnnItgC6qvygDES1X
	 brVEgws0IKxPGKMKD3ve8Y1bJQE1sC6mVKnXgP/MnlOLUS/IneCi7hAZkd5Yr/AV1uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595002;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
	b=BiCMXe7GV+SlKV6eU+19U2QqvWRK/hDONKIau0Vga31oFnf8YF9i5NJWQASz/ghSolnd
	 m/3PzfhBLMOkAymUxRpSn0PzQHz90GwpUSt5hU7anGitwrRNyZ5+RoLjCMk/hQWAW9vI9
	 LbtaEXQy8yJ0HqpjwEB3AD77de1waGlz5nTvOIEFnov1ndsNOeYjx8YRIM0WDUV/vR5UB
	 jgb33JR8cZA2Ffw31ru6DUvul3xTPh9FjC1lAu3QNtGYPDAQ9A29ctPloXz3P77GCtwYu
	 uwRhpkVi/l0gtFDOt9zZ79UzHWQLb/OydNdDetn1vPfNz3MsX6OhbxfXnp43faR7vyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fypvB3V2;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DD4606A327
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 08:23:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DD4606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fypvB3V2
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386bd881d39so3932445eec.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 00:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795595001; x=1796199801; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=fypvB3V2d3xEpW5liU5AyRXYNu0j5hp/AQW7FH7L2l5VSJVCC7tMEuWBzvC/itFWNc
         flXL9Jgfn3pzGTYtphf0LkmxMKlVMd5DhDh9nR2R/DfU26NXSsFqRknCIl1xVBk47Spm
         Qde5GRACmgG3CT0L+vKcsHPkPfxAvD0mjz9mvjuT35+tKEEhyJVAjG6/zXybh8sYS4tm
         UgYSaeRrtl3MJDf2RCYIVe/0ZGILTSVk+nMlm6aBuBTX0qW7+fLY5PH7lW2P8Ukx7E31
         QIICrnktmhbo0FlDFsoKSlo+bqtc6c9pYnlVz/TJznRUbhsLntOrXt8jISQVzGVHYwss
         NECg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595001; x=1796199801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XKcu1hf8/1vowb9+McXQ7a9vqHCfgDABTmuu0dmdG04=;
        b=COaiCH1klRSjLfT8N37R+oDP/jtcgc4ePRW7pJxxEiixpGIX39D6pJy1qCUnKl3i8f
         2UY71N85GhDl98CBaYuUqtqdGw0Z8vjAE8l5e0nchLs/fmRVJJRNp8cAyEnW7tGwCy4G
         vEUd4S+zH7FzBoOFGNnBXQsvU0Nk7beol/U4nESgSC2VJSfRU6AM52QqtBGTPdZ/+/Iv
         jUs1HGTZbyf7ParGiEGve0VYzy9zAFh37ObNtV31W65ugqC4Ku4w4at2rAB95gmktPr4
         3iz+z+9PZxvzIXp4MeLhNbjSChsjNS2OovRIh4J4SIsBahmoB0L6h/PDld/7eba3wOTO
         31/A==
X-Gm-Message-State: APuU4Z/sTJKPX06lZbMgP/rDsoygzfcOw4+8v8SGZPoPDR0j0CSQZjQO
	IhT1jM6ZB6OAG7WDMqBzgAh+OCNezIJbkinABFNLbGHXfof2Tr0RCCOP
X-Gm-Gg: AZFdTZcih38jZvlg5fiGepHZyLrBGeWtrHTXIeHYLIG5UTWydji5fwFFa050ziRgGHN
	7jsXqhgjVISK2K1j58h9GwQIAh2VFf4IYrnT6T2IgjVMieLHJqLhmQc5+XdKTnSb7iYKq87zpAm
	eQrXPOQWLjoFh6XvN+NodT271sph1X/lUPlYbbrinU4meZB48GFlbeNcgzj+CUr1m2/Ta/cFiyC
	7G7RUf5s5aRpmOxyFRy56WxFaD8MhUjyvggqhfV/JxNQTEtrOAKL8HDlNHyNgPgXLtDFqIkQM+/
	l0+OrHZcUYV6jF/SoxmjgTZkkwqlxDZhh7CGxs/Qf07JuTwmVOueZQHp2k+0Roe1j7eIebX9tnJ
	HW9HeGE4czVTpGEM0OLg5mry9yfoaNd9KFJBnqHOJj9HVBuqvPVr1V8khnh6RFPDzEnf4eL9E1O
	PTXO/2hWe3paCyfKmPIev5JeYzX33RuLzNkYquYhq3rEQsYjof3gOAXXkvwLbke9HJtKXIk1luf
	hOWpnrnk8UuINUwN75nbWI72IkaHK5TpBA6i7OMm9/M37NOQdyLZy3mrOmyOkaBvEaTtvSTB++z
	/On0hg1A8e3DCmArVlZ6Rv9MPBgPAkgSGa5azR0KhaUC3cz3HEs4RZoFomVWrx5u7HOOB1Mf
X-Received: by 2002:a05:7300:cf1e:b0:36c:b138:651e with SMTP id 5a478bee46e88-3857093fd1cmr21332699eec.22.1795595001427;
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
Received: from adlinkccoe2-Dell-G15-5511.adlinktech.com ([183.82.204.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm50919906eec.23.2026.11.25.00.23.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:23:21 -0800 (PST)
From: Dinesh kumar v <dineshkumarv85@gmail.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de
Cc: imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Dinesh kumar v <dineshkumarv85@gmail.com>
Subject: [PATCH v3 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
Date: Wed, 25 Nov 2026 13:52:21 +0530
Message-Id: <20261125082222.136238-3-dineshkumarv85@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261125082222.136238-1-dineshkumarv85@gmail.com>
References: <20261125082222.136238-1-dineshkumarv85@gmail.com>
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

Document the ADLINK LEC-iMX95 board compatibles.

Signed-off-by: Dinesh kumar v <dineshkumarv85@gmail.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index cb99fb74805b..baa96b004c52 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1577,6 +1577,12 @@ properties:
               - fsl,imx952-frdm           # i.MX952 FRDM Board
           - const: fsl,imx952
 
+      - description: ADLINK LEC-iMX95 based Boards
+        items:
+          - const: adlink,lec-imx95-ipi-smarc
+          - const: adlink,lec-imx95
+          - const: fsl,imx95
+
       - description: PHYTEC i.MX 95 FPSC based Boards
         items:
           - enum:
-- 
2.25.1

