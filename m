Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73AD202F90
	for <imx@lists.linux.dev>; Tue,  1 Apr 2025 14:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517530; cv=none; b=KzzxXbWpOnNcnoehSvUikosZDrwNp/6SerZCqU3HfCze9ScaadUrwAoP00kccwx7LLiGPdzYZAT+51mHgupvs10PKVZM6CL/afop6e913rZzIxrR8u35oCx2C2ww3cyAvTmSljDhU8W2R9c4ad+EmrZOzQLIklTNffELPHNpRco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517530; c=relaxed/simple;
	bh=Arp819bxRknwDeD70osYn6dTlFAlcGvt8KrCRnff2s0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lb6A+Je7mc5XcT1vqqDlPI/1mOw29lIlNrveQ4lPftJMEhYPBfDH+dTQKQOWE6X6fS5ajMZ7hwKJmT+XGCWzWTRCU+UYuUa5ra6o5uC+Hr7dceWuSpxzeFRwsKnGbcJc7LMMoaLKodd1i0QhOoGA44bKp8EUq7JY2WdSqrCN+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS8ZqiKl; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS8ZqiKl"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-227a8cdd241so20813445ad.3
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 07:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743517528; x=1744122328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=kS8ZqiKl+fRBha20waTSa+vdHMw7zZaUsttvA4OHqmdZWWwhbY8Anct067Vyx4JOVj
         z8H13P5nDYyTuMIyqJ3LC96SY9j4IyoXsbcNwalVF+fgMw4vlbXG6licZ3C+tEWWROcV
         vdP1fij9Xv6dsFxCjKFFXme3w3t/5GsaHtU3+0qL73Dh520elv2LiUNULGpn4SFuUOlU
         cg7Q2gCJCM6NTjSrCsUvmnSKLc/nqqrOEYsPSZsBXsFy0PQPjbmRsDmbSWIWjyz7GSs9
         UBM1cavtBU+EUqQygDbzJheFjrWvOV9b5vnhdaqpmUJJ6JOaNm0k+pLWakFgA9SretfS
         OKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517528; x=1744122328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1phRyZ5KcBrEb/h+2IGgPuNtDNLntogG8i/AIBPIi5g=;
        b=WKc8+8OEecZGx0yBtFQ1N2Ut8fSkewNuHDlyOaRetNH/RAFsEkCiowHzIMWEWQqHBG
         1PlxXJjrz4vz0OTr+xlCcvb/Dyqx/60c1LxNarFfB7m9P7wtQNuLMV2lrR7Lo9BfAuD+
         4vtb2gIbPvxeCa5Z8+3ox37xAa6Urhtigp0AIms1BfwOMV08IuE7Ffnedm525bRVYJHo
         gV80vMlrrZkgaRQraiH92bDQDaHjtGhYcm55CUUBcQp2EluJJ7a7DWf7p+XjCo8hD1G1
         exElefBZ8I1V4EIWbmfB7B8Si3NOimT5hMPudXr2HfGK6rR/LXhouEnop0v1BkCuCyFr
         Jaig==
X-Forwarded-Encrypted: i=1; AJvYcCXlQfNz6z50ESO6rHn2OcleMy3nAX+v6IXjdGH+g22RP/DyRozts/leiNIe0LeEde3yGf4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAjzYzHzaSAoVWh7fo9VqqVoD7yMegryXYxLDE6+3fC/SKJCKM
	rJ3Py36wFkbdsYbvpGU+XufDWBraqFOP0vbZicHO4jTEV14+3KILmQZ4A52/PxJ/Rw==
X-Gm-Gg: ASbGncuPVo9khwm76VJSS2A4yM35PkulBShwqNU9dEc15Y3Gp6ezf414PF9TzZ3sBng
	r4QFpVXqUOT8PgVOg0S5e8qvnjgxs0gJBeR/3EIMAqTQcwhu+CrDihY8jO3SFwHxRwHsLOiL4WQ
	EFaDCypZMOLJUtvjaPfBbKaO2MzBk+ybYOh/9wGJL0tNSDHZ2QepvC+cYjC59y8G9oUPRypzxyt
	B7UZAWO4bQ6KuKSrLyehm1E1f/WfhSFTMFL5uvE8DVa74ifpFwcFwaG+Vn8oGSFpwKN2K1NT5TO
	aNTGTZm8P7w+8zs4VwNJs8vGE6NkxgNTVRv3qqOJV2qppNMskgSwD22xPCM5LhrdYbE2cX8=
X-Google-Smtp-Source: AGHT+IFV9dBzNcxDUHEuxWuZhPi/1saRFkCoRQug1IzAs4LF+0tMPIs9Zk7YIgX5WGynxkjRbFRZFw==
X-Received: by 2002:a17:902:c408:b0:224:1609:a747 with SMTP id d9443c01a7336-2292f97ba73mr186070825ad.31.1743517527938;
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee22a2sm88704425ad.81.2025.04.01.07.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:25:27 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: shengjiu.wang@gmail.com,
	xiubo.lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] ASoC: imx-card: Add NULL check in imx_card_probe()
Date: Tue,  1 Apr 2025 22:25:10 +0800
Message-Id: <20250401142510.29900-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
imx_card_probe() does not check for this case, which results in a NULL
pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: aa736700f42f ("ASoC: imx-card: Add imx-card machine driver")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 sound/soc/fsl/imx-card.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 905294682996..3686d468506b 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -772,6 +772,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].sink =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Playback");
+				if (!data->dapm_routes[i].sink)
+					return -ENOMEM;
 				data->dapm_routes[i].source = "CPU-Playback";
 			}
 		}
@@ -789,6 +791,8 @@ static int imx_card_probe(struct platform_device *pdev)
 				data->dapm_routes[i].source =
 					devm_kasprintf(&pdev->dev, GFP_KERNEL, "%d %s",
 						       i + 1, "Capture");
+				if (!data->dapm_routes[i].source)
+					return -ENOMEM;
 				data->dapm_routes[i].sink = "CPU-Capture";
 			}
 		}
-- 
2.34.1

