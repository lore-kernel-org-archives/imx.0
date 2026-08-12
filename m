Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128B420479
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529704; cv=none; b=qNXZb/uT3ZUU+0wZAtF0v/5JvcisbcPyuR+yiNKzHg3/btwhxYJ30KMvjP5dSrnaFPGM5bozxKjucrnl6cgnEkhwZxSseAnjL6s/+ssnoISD73sRJcCtOGnvlVaJtyxfrrfhq2dvdyxY91+xUxw/u4uQDkF9yaYfGdy4rxZanE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529704; c=relaxed/simple;
	bh=4BhTPX3pNziHNfBGlg/7EvSa3yOHXxAR3Y3AgDtsako=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WtnxjclvGL6D+b+ukOC4XGK2uRbJGQa1PIfcY7j1wriyZhouuH3DMeDq113ivvg3uqgBEDueyFjuDD3UsuHv9KKvtI802pSmbBSZUIqlOcaRK/dF1p7p3pYitHSfqAS+c1iSApQccntmffgdU0kB5/SWYNDQrKJKZE58jHqyRI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNZgObpa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNZgObpa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cca0c5799eso10462925ad.0
        for <imx@lists.linux.dev>; Wed, 12 Aug 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529702; x=1787134502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=WNZgObpaBV8JNkD2CUDGOcdCD4KwA3k7Xuj7yxurPrBESp9CEyL2hzSMZDZcvicq42
         ttQan8QseTlKyZyKYxRejEpVlWBoIBG8p6vSz5OjNjtyFYobIuXsJNNrYKyWNtsfhU1P
         /tKdy1iR++RH08ATp8+DncYyd/L+mJp/VVXUyGY7ziFMrodyMG2MwXOwFRtlrvMePDMn
         NBzLzOQQIi8KymXr/PP4sTxBLlg8/zx9K3j9QR37yFysw1WN6H891EQa88l9ZTr8Iu0d
         J4WzNGdG+ADtr6Vyi1URx9V9DTct+ITGsrLRhRr4SraO1b3Ybj8rJfdKvdex4Q2ivYY3
         8UfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529702; x=1787134502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=Bq74dpbcpG0LjzIV1x5fCQJpkggLujvYs5H3J34MuZDT2TAAupwfJ4IyZvgw3Hw59c
         LXgOLCf5KUqXWWbkFWXRRbySACMY388rUJFDIWxM+ORdV++kO5J0Fdaff1l+blaFu+Fn
         zYa4OdOCS9t8tWjXJmV3HuxgZLQhEN1lhRljXvhBDwXmMlcAtIX8ztgDgC/fjCWktzQV
         datsv6fzgnaTQn4u6CVzAYxcNL/mC9dW1I+7fSK4GvG9veOjKBuq6URtpMy9utArYLeP
         ELGI4V9XGUdiaxpKZsdO4lfvFtPSjdkzJS77oyhxCuUEFdh/1H1w/UWCgSKGbnIEQjmP
         /RIg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6z6b6Y3HjS/ckfXLSGy9coYrcdxHXxvWHjHstT3LjpQhrbW020BvXEpO8v6iHGed+gf4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzm1D8RyJV1ZcqzGhecq4h3tNi/Uw1OpLJn1ArKd1nJDhFBuCo5
	Wio3qyzp1QbjmefRUDvS0q8gSP4U7/4SB3o4LIgBqcMuOUvr5rL/T7V2
X-Gm-Gg: AR+sD12QTDY8xWoPvL+eBE33FNcOreFxQWU4kIKRVxsQgdRgya1QfE1H8vOj6pHeYtw
	kBMdEIAZIFf/vyjYSbeDmI9xyn/xFL4Tnraqw6MlboZebSepjxQu4LMx9RlmGe+j7JSdJMGue9e
	842dVWOpzT14kSwyJe3x5RfyEQ0xDGNKeDQBI8MxXRWUdcsebJarQVj7kLoVWMhS5Q8FQMvUFhJ
	bAOEIbii57jn6ZSHC/2SEZMC2ru8ZupltPznBpPTKSa5bFsfXxaYNQZFFohJiioRE1rmlHfTReV
	DGd/xS67GochZwaqL8Ge9nM8F4VXIsl/xJxILaYkLF+VdpnPLHXYi+OIDJaqKuFkal1DCx7rLoi
	lZTFc24PLiTOc/411XTT9o/+NOmJIPGvG/xILiMBgqrDl1yj13GQpurmgDfwKOKiw8ekQAF4+HM
	MqzsItnPW7XQ1m6w/dlOpXYCfa4L1cq4K3LI1hotNCRZGdO6k/lXBCHB9kveHmG7ok9eiFyeaRZ
	tPVCb0P/w7ziAI5CQK07C+462VwzUQP3wnsBTDPJsOvS7Ze+BJ34a8tKo5D5Ef5l9wQ9f8X9uyd
	QBRMExM0mIw4v6s=
X-Received: by 2002:a17:903:191:b0:2cc:d69a:354a with SMTP id d9443c01a7336-2d3457202f4mr40437445ad.22.1786529702440;
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mxs-sgtl5000: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:18 +0700
Message-ID: <20260812101418.37966-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index f1c0e612313d..a253a48ca59c 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -155,8 +155,6 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret) {
-			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
-				ret);
 			mxs_saif_put_mclk(0);
 			return ret;
 		}
-- 
2.43.0

