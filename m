Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795362923;
	b=meIDtwSdEUzwE5ag9U+6ilc4nefFyuG5Jdk4MhAyy0/LLPVzoEEAGUeID5OXL7iD0NwI
	 9gxcYcsix1CEJeB6zsYe1prAI3tp2pydLO1jNTeH98fgpt8pWCUM24FJaMmLl2k0bmZ9H
	 lst/jXL5WY4sdh/KGYxXQZk75vsUrpVd25nRxpxmgbuj0M8gyU5nql144wBuSKIyXA7yn
	 lbSByDxH+jyKLiniJNHEGImYcfoxlmBnfvDw3z70bPa/MqyKX4UR776xQIv9DaG39gz/Q
	 CRlyrBOGzTwvx2sXULRoNRuVZkTMYdwU3hhyEJYKaKzcFiV9RFbByoVStLf9CwoRg1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795362923;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=;
	b=KEB6iEt+VH0jSpFkPhicXS5P/aK8FVI6dvq6xyYVoVto5bN78FrDYr8zvZK4zsP3a1cF
	 2DKpxvpLylX7QK1uR0sJcGbAn5gt9o2/MNVuRuVGSrJv+bp63hQFICfGFjZLLS+mvBpYD
	 e+8g493fKlYtKuxyA6tpoSWPaDSxb9dWEJX66ygdeE+KoAccfrAcJ/OtE5xRTsYxxoMZX
	 rMCzU5yCdSZOTtw6MeZ2qhiUi8R0zSLarjNaPcn8b/yKXsFMhCnD5mX6Y10dYz4MUlRIU
	 g5Q7Jjhis4h1MO8zQ9O0loE3TivzV+orBu+i2ZtsiVgYvvaBixdBFvl0pCa1JWh0ZkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jZ68z270;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA0606A339
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 15:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0EA0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=jZ68z270
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e3b22e971so1269148f8f.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795362921; x=1795967721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=;
        b=jZ68z270687DssMqjY1LlWz4rPtlmR4yAJDz+t+bzUeudYoThM2ZE6nxlCJ+ZKUymg
         H3IUKV+1Vx5xeKe+KCMyYVEfvFttslG3a1M2151Mhid1HMbH59McGVz5FFeMlPZ5KHZD
         dHmwc6+Thl+hHyYCkltgL90jwxRZJ+At0nzm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795362921; x=1795967721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZGa4bNi0q15yRe5T7kbprOuROWeQOYZpNWhT2mvzHGg=;
        b=juNSR1qQXzJ40+7rBumz0+bxdBzcWJeUCxvKAydpPRIfoI4WFOIrG4KOWoIFyNPvoP
         /DqcXmRfweChCszJic2IJiMdmfs5brp52HNDG8LUnF+BcYDeoBEmpo/0rSanf0xwSNKp
         Al1fymt9/UE1sct+GDNJ0IwzkoDiE0D/qZuwSad8IlsTxrd1uzazddbdY3inAVAXcr3k
         f/Q7p4r6e5bkrG5FyWCc22sGRJvx6QUd9ljIFXL7xozYNE10jT+/bpA8olP4lSmGE3KT
         YGTOTo89i3jRdTRHxsNVhKE9hJYeuZ51yBtkU++MfIXIpz4k4aYTusVkG+BAW/gQCxsC
         4u8g==
X-Forwarded-Encrypted: i=1; AL+hErF+cgOd29zfYuBq0XDGnhFcuwu7wAm0qVlB5TXZocnZHigCP1G6qIe7318AfBASJipnvxw=@lists.linux.dev
X-Gm-Message-State: APuU4Z9LmsYMB+v+0ttIsmD/ha0TEXvtEXwN1BHccQumr3Co9jY3n9ho
	v2e65urLlYkSRsxIf4fXJma5H6QLZq81ZDPzkJnzQHQFxVUOB3RTisuDHg6jmaYoZQ4=
X-Gm-Gg: AZFdTZdhqVu+Sz/zyXwZDNR3kTGSyKiITIggcodd63U5onNRdC4JLYfcocJ8jskOgpK
	9RFCQ8cBLFDARhpfEVY6EMTYP6kDpg2xG0VdPngN2SLUbBOPLDy6qKzTslfGaBAzZmh9781l9+x
	oo1OEYkXAGe6qcEUSWfPMyUZ0KRXnMGrfdrjLWAnCp7pspmwAIZVqHAK6HWpuxfoWwNZOomWcni
	/uueswh+XHRRp8bw4SJv1Te6RN70MFgOwQlg7u080XAUvUegpCVf8R/2/MUsonbLOG7SLXRR0na
	KMQJ+xetMMhJUCvIG2QAWZVVfaQqfuqbr/1ziDclJAuqFPTCssyCYWOPOVtBoA4Roj4Dil5UWoS
	HLR5HXduxvaqCaiKT0f6J2ItBpvFa+e3ODiaIGzV7uI/Tj9TC3jdTu4f4w92cE1h1SwIh6veqAC
	Bml1C89mCrJ93NDy0c1oJ0jEquqPYztrAORUy8GGR9KZD9ADCPsDrQEoQsMYVRsNjMMfPeYLDS7
	mdCQUp5h/WJCIo82Zs9m5tkn7QT5Z+OV2KIi/r5P9JBYCkUopXJdbzX9T9iLMcktE0HP/gCPra2
	oRIatMam0om5OnBieRuu07rh8xxdkDa5ojyx0923XPmJCxC02Bls38+5HwpWvZoCOPb+uRY8d44
	+REh+ejQsO5Qxgu5Ex98fZKsKj5xetgBXD+aFZWZMlzPMDST0eVuSzaH/pZ6pK2TQx8ouC8R6BX
	oIFwDFr3iN32y3C5ky6xhkC5WN2E9lL+BjqKNnvImTE6lpqMru
X-Received: by 2002:a05:6000:25ca:b0:4ac:7595:6f67 with SMTP id ffacd0b85a97d-4ac7595721cmr13682565f8f.40.1795362921141;
        Sun, 22 Nov 2026 07:55:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm20046526f8f.55.2026.11.22.07.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:55:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 16:55:08 +0100
Message-ID: <20261122155514.10289-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
References: <20261122155514.10289-1-dario.binacchi@amarulasolutions.com>
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

If devm_of_platform_populate() fails, the probe returns leaving the
power notifier registered on the bus power domain, while the memory
holding it is released. Remove it.

Fixes: 9cb6d1b39a8f ("soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-227073@kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v3:
- Add Reported-by and Closes tags

Changes in v2:
- New patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..7d6735728d8c 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -345,10 +345,12 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_provider;
+		goto cleanup_notifier;
 
 	return 0;
 
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
-- 
2.43.0

