Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD013E408
	for <imx@lists.linux.dev>; Thu, 28 Mar 2024 22:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711663998; cv=none; b=uPVey1o1xQW2WuXxT1yBlwykmxU9c5+h3BwG4VFewty0Gbo7c9/G9wmdQACGI2B389rCTMZTS2P6mzrZpxnFpjI2EXXnpZjhKOEtkQdbjVSOcjUTlfrfWiZ0N0qkRTnm3lGEvVQW/KF52AAevG0sQtTufh3y6TK8kNgieR5nztY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711663998; c=relaxed/simple;
	bh=1PzBA1ZhDSUeePpyVhsP/xK3wpo45qQhYq7BBmEtqKk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ukb2FrTa0bj0+lWlEQHvpf+V+gk/4bGZnqc6asvqBFy+Ki5OcmgNf/ZoRCNECZ8xdRyOHXTmk3lt/JF1ot58XJdHVW/knztj3690ztDknczRtt4pq18fIspDEigUpZ6ojcLNbfVlTy2FsZsb+W2M+KohpveDS4AwSlUKZ+/yryQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fpc6NO4R; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fpc6NO4R"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4154d24cc77so1353315e9.3
        for <imx@lists.linux.dev>; Thu, 28 Mar 2024 15:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711663995; x=1712268795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rgeFRnsuK46b4mipKZoJnQ86ybGPBmi/R5eXJ/VqwjU=;
        b=fpc6NO4REmqi8PdF/XM/vtb+wARFx87xPr9HPvQG8LuCpkPrt7RE+U5VR5x3NhPTF1
         lX3FQ8BLb8vQSO/kXGwP4kXAT6KtiM2sQefx47yqGrLsDchsu6zEfCG+AT3PIjmHb4qO
         mj5gkVthyOZbO8GXp7TnnGAbYeowyzE4rt0506D7W0fTn3y9GN6Ka8ul3kn1D3Qx54Zd
         vbJHYqfQvXPt5WVKtS4c3BivO70FjLToCMgB/61cSLEb7C08UicJGE3q/fPJIzZEJvx9
         0jKXIjHG9HZgSjX/vEV0E9bEDiGfGhC2tQPN6MbMmdc5JIKvgzcH6i826RL+uisNMdWr
         HqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711663995; x=1712268795;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rgeFRnsuK46b4mipKZoJnQ86ybGPBmi/R5eXJ/VqwjU=;
        b=NH5uXMxajqyJX1CKxmlQcFM/ftgmTF0D4CivPWxoAQ8HwZoakKPhHE4d/9vUjkc50W
         iupZQBTlHC549VLvy07VcVd9xVn+XtHyncVL3mWNwFzAuWdXHk6m72X4rtPKVGeQvyX/
         EyuHk97jWJGNWVgKfOF6p8uXDo2Pivd1f767bab/8IVH2Y3vONKOTp8UeCIhMehCH37w
         y6CdSjVoyG8H1k4t89scyvQAT2gb2CuHER/KBXbyhyfaOUNdXTY+ahjARXWPddSbMJRV
         ee5CdT3HDUft7n4ZBh7s4nk9qJJqwOFBOhA/zyRgS9XjMK31Tkoh8hQiVMzSnEuag3Jd
         YibQ==
X-Forwarded-Encrypted: i=1; AJvYcCUocC1Z5PIIzxfJop1GS5urjIjVOc3PzrNpkk96jU4WizDg3u1vL2NcI5OBaTq4ZAFnQYcWf7UR1HoeGuml58Vfo9en
X-Gm-Message-State: AOJu0YzGcNPY+T3EKXaMKnMUJ285AFcF3wtkeurDmWuOfjuF93GY2vOY
	tywYpLlgz1WA0gVUg9hVGOfBo/L6Uq1n1kgQQMZyt1X4meoDllCe
X-Google-Smtp-Source: AGHT+IG7j0PIvRS2ho64WTC9ZlQn1UU5XV7+bm1YY6W6CbLSDzZDBXi8iOrAmHVFr+wqVDakZH45TQ==
X-Received: by 2002:adf:f189:0:b0:341:b9dc:eb03 with SMTP id h9-20020adff189000000b00341b9dceb03mr256125wro.3.1711663995131;
        Thu, 28 Mar 2024 15:13:15 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.208.244])
        by smtp.gmail.com with ESMTPSA id m28-20020a05600c3b1c00b00414688af147sm6666778wms.20.2024.03.28.15.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 15:13:14 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	peter.ujfalusi@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	daniel.baluta@nxp.com,
	iuliana.prodan@nxp.com,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	laurentiu.mihalcea@nxp.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ASoC: SOF: imx: stop using the imx8_*_clocks API
Date: Fri, 29 Mar 2024 00:11:59 +0200
Message-Id: <20240328221201.24722-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The imx8_*_clocks API requires keeping track of all of the clocks used
by the IMX SOF driver via an array. This is unnecessary and doesn't
scale well. As such, remove it altogether and replace it with
devm_clk_bulk_get_all() and friends.

Laurentiu Mihalcea (2):
  ASoC: SOF: imx: drop usage of the imx8_*_clocks API
  ASoC: SOF: imx: remove imx8_*_clocks API

 sound/soc/sof/imx/imx-common.c | 24 -------------------
 sound/soc/sof/imx/imx-common.h |  9 --------
 sound/soc/sof/imx/imx8.c       | 41 ++++++++++++++-------------------
 sound/soc/sof/imx/imx8m.c      | 40 ++++++++++++++------------------
 sound/soc/sof/imx/imx8ulp.c    | 42 +++++++++++++++-------------------
 5 files changed, 53 insertions(+), 103 deletions(-)

-- 
2.34.1

