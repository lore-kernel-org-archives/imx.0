Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD74D481A8B
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 14:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629970; cv=none; b=KuIhFV8kOoxecd5RMzYBrgRYrWZuxfWjJ7RCyP09Ng9zY13VwrF/6Uv3o+P/4gOiqpRcQLLIoBHfY6f8m55t55a7m65WaD5nAgF9AA7K5BVT4R13a5ndSkf7DGLH3TiHk4JALF5HMiB8nfu5CN6Hrv7YXQfJmtZ9uZLh2fleWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629970; c=relaxed/simple;
	bh=ZQgiNiqYgsBrWLZgSSsY8QzFfXicVpacPgeKKriczcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hRaSqECHNIE1qTVDgsUTtgC20bbrMGMpiTBKVO+PGwqWxx5tz2zJd6kLpBTyfmAGPixbEUWS/WdX9//h6nav5JnKzoIWH3Gi+hxUW05hYcJejodN+Nj1OjwWJBcOLUdwBs69T6tnt6MoHfLbchbHu9c/by/sxK4NFCt4y4SJYLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jshyzOUb; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jshyzOUb"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47fd66a094eso846953f8f.3
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786629965; x=1787234765; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=jshyzOUbIZDxeEf3AYDqMQBUzmz00BHVCzwapr3r1ppyNLa046xvu9JfaoiblS2L43
         XEkan4JCxlye/TqQ2XZnKh0EwxHLi5Bjk5hg5+BPRbNyiM8RgvyZwEW0Ka6ayjVmUZ2O
         7CSM8o+mne2+ZXmw5fO/Gv/FQcunvcMgSxkrmY47qfGx5mfpNjvgw0ECKZq0WxDh3FK7
         ALi/9DQ1j/BDftKOgu5o/xPLbXzkLFhpY1QBdNMNs0YkZZjS7A5n8x/EWadNmq3NCZMA
         KZl7GVgUSRHOTXt07fqnAsvhMXRaDNLJV6Z+G7SlhaGDK4HjpCxgZaWnGOT1+XzaGK+w
         xRTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786629965; x=1787234765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6wNKUrjtVLeG944flpny8Q6wVXCAuoMBESObIQ6TAV0=;
        b=Eay0JMDV2EwgllwaVaM+BzQEMr+Facaln+WvalBR0El2KdT+Mbpy2H+u2HTzX2bbK4
         pMkaTBggAj8LttQXpb/veoHm6+vhi0JC2fvlFeyCXyYUKTRcjRB2Kj4JrZs1e7UhKGJx
         G5Q98z3nt02L/fz1wQkq1MFQPQo9P2CgW5lU9WR8nYgg8QI6oIxmv5hqnqEZ6NPzF4KF
         RXeT2mhZCyhLS5iqnaw2PfSJHyyFpIPiZHQIPPTOkYzLSGMf/vkUpWan5zSk60CxDLgk
         fbGSXBXso2Xd63ippDGhubLzNbtFcGzjWAAThKZsMocv/EIxLsQ4djcgTfd0AHELvlwN
         Kmpg==
X-Forwarded-Encrypted: i=1; AHgh+RqPyllsPX0JDj2HBvrRLF1hR2ttwMVR/lUNYEEKBFe5yIwhOvbWDzn5zDylOFnkEUnLm6g=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfFcEmDp5SNRS3fC0Eu+u5Rrv4D+0nyJ+RRLMpsxEQF5DaXuvR
	jS5tfpFDNRdVTNhOE4yg+Mg6k0pj4rqXQAcRSBaDO932DU+U5mPvfINY
X-Gm-Gg: AR+sD116ODo2hdcu2DSHNX7IscQ51UpvmCKvWYn8NeU7DRvgBXYbOCT9i61clmb8aIT
	Dq883UlXqym2lXFGxsoWPhNE3GiR2HV7NJTsTBOk1YXofj7CzBpNab1l0STksxoYlAm1XhK8RnL
	Fv5LkncG/CQo0EvkpQz0q7v8O2/AN0McUqo2msYnMhrpBGt1kr8qDxMQOALRhZ/nDDhYL5RHgss
	u4XRsCMLbZhxNDWbj3j9dffynq9SJfASJ/TFC6lcUlT+9Jucm0PbVIhCnCNodSwskdOXd32xdMw
	mUJArzbrKkIKg05KncWGyyNBgYDBN6iovozynAwCm3YzdjgDGBBDZ0rkAKD8mAg8Jj8eWrDUbeY
	JyHi2tlH8SOQOiRnM3qrGJLXAYTOsy2GTRUmOJ5656Kfge7WTQvUpCAuwY87jLRMEliRnbMXQX8
	Ph2TYGBx4TT6BWZoqDk77zSJZDA5BPMzyw4dnZmh2M2w4ImRdpL93Xp2TUIfijSC+Cy7FflFe9v
	dC6
X-Received: by 2002:a05:6000:430d:b0:481:568e:d6ed with SMTP id ffacd0b85a97d-48159ee5201mr8885423f8f.15.1786629964824;
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815a5af191sm6690190f8f.19.2026.08.13.07.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 07:06:04 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v3 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Thu, 13 Aug 2026 16:05:59 +0200
Message-ID: <20260813140600.1824949-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260813140600.1824949-1-mehmet.fide@gmail.com>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

