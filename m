Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBBD312827
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 10:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766054871; cv=none; b=ptO1rlIysGankPrx78PkEheg+JpsTT45k0p9RVp1CLKGr97uMWEBjdXh28VdBGsnoy7MXIngyaGKjsohhAWrqi6Z0a4baqX7xM43G01Usht3RLybJNH8hMF8+Tt2EdFtxQNMaXU9cW1Lq2gAr+rjdcJMYS+1PFFFhDyT5kYhkeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766054871; c=relaxed/simple;
	bh=rfmBDxSL2uBg+nw/44jCY51xi8cWyCr1IHqQEe7M7Lw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TYp6qj9FOPE/LVwjRa6TjfpWljO4ezA22uC7gpHSuNbzWqYLILYqRw6IEwsxPlWHfS52/axZrnFBcw9sRf8XdxVTcexuxDVbsyjrlb069P7rAn8hv52gzivYTnuajVW1hRVt7ceyA471Q4Kk1cLMvdNNUSO1yNdlz1QJnM8reVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TMClrdre; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TMClrdre"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a0d67f1877so5720625ad.2
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 02:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054867; x=1766659667; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K2h4wBX5s2YkJE1Ho8rSO5wuuz947hqkFTnohz/OHlI=;
        b=TMClrdreki8jcv5KJ8kI/6bXnqchY7AT0ZhRu2NUGwXUU8i7I87ckiz+ttgqJTTGij
         oVWZTyBJX8rxncF9AAP8HH26NESBm0X07k3+XYrk5623Ertv2RceqhkL49TsCattDiKY
         jBBU10tSlBRW0XL3+E8ZNmdKFiAdnldZ8umEuDa9VBLLOsEswzHgHtACGrJbQ95SIhxT
         X8GgUQxnp6Y88kCvkJ8pqNM2vWo6No//l3voECUpDnr1J2ydEsX9MLMqvJCMCHgQNxgh
         NsL5tynfK+dDGIXfMogtmBnIin8hFnLdcTeOWaHw4s16XJHfeK8ZFH/FkcQ7ezpija6Z
         KkuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054867; x=1766659667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2h4wBX5s2YkJE1Ho8rSO5wuuz947hqkFTnohz/OHlI=;
        b=mWuaTjU/Z8MG88bKhaw84JcfbNSAAjIdSlSnx/xY1gmi4dfeV+iWigLdfqkoN+YlBz
         g09B1AolOvWOJ5FFJngoQibs372Duf247CMylSByXyX5KC3HbU62DUhIccTN6uofgmaa
         pWkT9skBEzxAGIFNIupx8k28otu1oObUhWpx8umkpR/9DKmHHv5Dk1vzcWJWCBUwpql8
         QnTJ4B8ENTimkWeJRtQQeaV7OoQnXWjtdYiJp3oiFNJIiRqU6fOZ1sPQf8XsldtG7djF
         hhW53S/WTbKwQ7y1iCGD2RMEQFgjZg5nQQKqG2g/Q2Z8Zw0bqc7yBogLJkirtb3SIq1z
         JgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZSI3ZW7gpl2dYfjsK3Q/mbNYH+aMGYgOPivqGwWCHew6vRGc+F92d7R1cdwyd7TLopfw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwK9ebSxUzFyDYAl+MRfJltJsg++vCmU73HjkLG79wBL9FxYdsM
	/GWiQ0Brj0EESEEnbnaIbD/+Tyid7QI7m8AsmDajW+cc6tJqfyVcgEwD
X-Gm-Gg: AY/fxX5RR863/gBgyr5dh5D2KMUYcQ3HudtzSir8ZSXton8H58zTMkqkNoCHNFwMwrp
	cU0be3+lZQoPDZGwuRw/Vuy+bzKfAWq6ihTdt2pJEvBpqMJ0l+o3W2Jrw7/HXOF9fA/NUCe8nDJ
	FhJ9eIQPXt4QdE+2k9CUtdlaxpFIJxxDMyrRPDSpb5wRjIZk0nydfJ68/AqC23C/dnOt2cZsfif
	zcIM/RH0DRuTR6enPvJo/1DUy1wff+1EjjhqvX0pZoMofeeoeSa0r6nDUZySht9X2TzZq/CDrAW
	2CondbWxgE3vzknUMyaBotkA47pMF0mcQ98WiG0IbEynRC5DYWR21JXjvOZg91QnDmuDV4QoRqu
	/zQuzBg1v0u87n32TY+MC/JgV1+/1vlaaL8TvbvS6zHESB/WljNkaxQxwynsfxOPJ5Koab7K4/0
	B5icKZ8tmDrhIUa20mtwASswG2
X-Google-Smtp-Source: AGHT+IGdNzK/RTR5elTkZ8c3MxFiciAJNSLvL/WBaVWsxcJdfBpM9aNo6l3mZEvLo+kMJobLHKqspA==
X-Received: by 2002:a05:7022:e1c:b0:11e:354:32cb with SMTP id a92af1059eb24-11f34c39abemr21218133c88.49.1766054867436;
        Thu, 18 Dec 2025 02:47:47 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:75e7:7f40:e8b7:c3ce])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061f473ebsm6772071c88.1.2025.12.18.02.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:47:46 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: fsl: imx-card: Do not force slot width to sample width
Date: Thu, 18 Dec 2025 07:47:36 -0300
Message-Id: <20251218104736.600794-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx-card currently sets the slot width to the physical sample width
for I2S links. This breaks controllers that use fixed-width slots
(e.g. 32-bit FIFO words), causing the unused bits in the slot to
contain undefined data when playing 16-bit streams.

Do not override the slot width in the machine driver and let the CPU
DAI select an appropriate default instead. This matches the behavior
of simple-audio-card and avoids embedding controller-specific policy
in the machine driver.

On an i.MX8MP-based board using SAI as the I2S master with 32-bit slots,
playing 16-bit audio resulted in spurious frequencies and an incorrect
SAI data waveform, as the slot width was forced to 16 bits. After this
change, audio artifacts are eliminated and the 16-bit samples correctly
occupy the first half of the 32-bit slot, with the remaining bits padded
with zeroes.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/imx-card.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 28699d7b75ca..05b4e971a366 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -346,7 +346,6 @@ static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			      SND_SOC_DAIFMT_PDM;
 		} else {
 			slots = 2;
-			slot_width = params_physical_width(params);
 			fmt = (rtd->dai_link->dai_fmt & ~SND_SOC_DAIFMT_FORMAT_MASK) |
 			      SND_SOC_DAIFMT_I2S;
 		}
-- 
2.34.1

