Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39991C1ABE
	for <imx@lists.linux.dev>; Thu, 10 Oct 2024 17:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728580330; cv=none; b=YQc033e2qEPJQannz4V5FF8AphbWVsnoAuFBBYg74BzFsnT3pO8UpAJY7qib/zAJu8b5vX6HA31Rf6zJw/+GlGS7VihRLLsrznh7okIMwQAucdesNB1MxBcOqq601h1HnRyfdrfzse6xEghjkZwUeZp9gYbCMeh9rkYzdzuasJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728580330; c=relaxed/simple;
	bh=CfmdVIigFTKsaKjDrRwpPj9TS/i40iXdRpwRsaOLI80=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOIdbd7liN8xn1FW8F9zQrfAfmPDmhSf/8YvTJtkrZ6jaenZglykACPK5DYyNdhByAGuNlkdUfugYuohCf68hVQQDU35x6fVkEQerRVLB30cYRvbdDu9KEZBaXS46e45072QIN8aAT9SHxzlY05XD6WiKz5GDFAL7dGrdniRMvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOMD6IV0; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOMD6IV0"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-7ea0ae67df5so873510a12.2
        for <imx@lists.linux.dev>; Thu, 10 Oct 2024 10:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728580328; x=1729185128; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRcjJSkFKBATdPZGwqrgjzHhU3cecH79PFdxY+J/PZM=;
        b=gOMD6IV03pVr1Pq3QHBEMaBvS3U9tyl5bqRZOdJzIMB3Lu3Z5ecrcY3zy1I30KOkyg
         MN3w2VKjobn7tmxOAWlBzT5KVxlFkfct1PvUvRIimhpQNpLOglqhcaKtrd8hpCtLcIRv
         mw2whgK5jBliC0CJ/+9Id0mSpniIoVu9vkChTne19SfZNHWABD0Fb3u2hMjf20kj1hAl
         +bI9TvLcTUkZHlnpYrRbL7NtHfpKVZIkyJpsV0WJV7YOKvVFlZLH1w0JsI0BjyHY28AL
         +E+sEwHfvC78vEr9z7EAt9S1ck+73wyitofzUzQjBMpo0JeB0tJh7mMtxGJpD56QAA0O
         binA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728580328; x=1729185128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRcjJSkFKBATdPZGwqrgjzHhU3cecH79PFdxY+J/PZM=;
        b=gwcUsjbcUsor/plhwx9eE2tQCDfuzYNx42w9VkeIP4D+6y60PH/l7CICKAHwu9ltlB
         vbtsoMDftfXTswQaugkEDq8b1OXPGGEe7fif5iIV5aP/HjsePxIgYYSDO0HdaV3b9i7W
         leZCUHCpGnNzGUXNUNaYvEafcZ/gYp46RypAP7HC0PPZxtC84qPXq4TXoyzS/d+PqiSA
         V8Vo3WoUXsaY9k9sEuDGwBnKrQHrBIR2OJh3gbncBIk+uIhyDnSUCIxexOaPnR2ZNU24
         K1N7K5jSH8uXZKWmF7bGiosP/2ljgItW2i0G+r9twVhdX+yjhkbVs5WlHhwCJ5EEqXMT
         ujsg==
X-Forwarded-Encrypted: i=1; AJvYcCWL+flFJudivlJynXGoXGq5Ak6BpPfh5TAJ8+fyBHPqVnS3ohv9KI+FFWzunUnM3jTdSHk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKCt7uo1GioUVmtMHBrADaBunDJBqD0sfCIaNgVRI56B+wn9nC
	ydY5sqPeAIQgpZQF0FQYl9hzhcs8J9mVOdFOsQdOBOc2WGylPTp9
X-Google-Smtp-Source: AGHT+IHjnmf2T4okdHTFLwxXmUly4FlC0XC+124pl5lRssFpr8SRSvJP1wR2VBn8R34KWSjREBTO9A==
X-Received: by 2002:a05:6a21:3117:b0:1d4:4a69:a0dc with SMTP id adf61e73a8af0-1d8ad83c775mr6714607637.33.1728580328297;
        Thu, 10 Oct 2024 10:12:08 -0700 (PDT)
Received: from hiago-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e2ab0b5d3sm1251245b3a.198.2024.10.10.10.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 10:12:07 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: [PATCH v2 3/3] ARM: dts: imx7-colibri: Update audio card name
Date: Thu, 10 Oct 2024 14:11:28 -0300
Message-Id: <20241010171128.107819-4-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241010171128.107819-1-hiagofranco@gmail.com>
References: <20241010171128.107819-1-hiagofranco@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hiago De Franco <hiago.franco@toradex.com>

Update the audio card name for Colibri iMX7 to match its specific SoM
name, making it compliant with the other names for Colibri iMX6 and
Apalis iMX6.

While this is a breaking change for userspace tooling, it seems
time to implement it since no ALSA UCM or related configuration files
currently exist and we are in the the process of creating them.

Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
index 62e41edcaf1d..8666dcd7fe97 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
@@ -120,7 +120,7 @@ sound {
 		simple-audio-card,bitclock-master = <&dailink_master>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,frame-master = <&dailink_master>;
-		simple-audio-card,name = "imx7-sgtl5000";
+		simple-audio-card,name = "colibri-imx7";
 
 		simple-audio-card,cpu {
 			sound-dai = <&sai1>;
-- 
2.39.5

