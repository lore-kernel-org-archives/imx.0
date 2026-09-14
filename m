Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7F4448B97
	for <imx@lists.linux.dev>; Mon, 14 Sep 2026 12:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389590; cv=none; b=hQaoEezoxU3Ixl9KNRrsCJc7yz2pORfljkmOcgPHnf/BxfIQr9hIeQxYqdxHxNH7RQF+McfhENjoOhs7t4vNoRG+KXlONydSWclh48vmEIBpQHQWPvQh7AAJM/h+T7GWAaZ/HTkNa4Xs3/RZClSF8jZydBDqJZUU5wtKKw75hEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389590; c=relaxed/simple;
	bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pAZ+TcWS9tLrVBpNOZHa9DFx6KoDbxy+ToTnwCVKqMv9RoGNMibcbpWpV2QXoUSSfqUdJrBEJ1g3K+uqBWZp3Nu56+xMW+aQghbokxlr5tAdRMJk9kEc4euk4FRsAWHt709b2FVuB0iYd0GSj7tEKJ0ll1KP979jUz8pkQsAins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qrUUmPFt; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qrUUmPFt"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccfd61ecaso19005265e9.3
        for <imx@lists.linux.dev>; Mon, 14 Sep 2026 05:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789389586; x=1789994386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=qrUUmPFtc33SZRuOr0KjIRvckZS12nxvim3fPGyrfcsxyztZOsyxG4Pia57UB8UOHn
         NFO/5gTpmougpXECs+ct9b0xb2mRNUx57ids4XEBXAfpGTpFt4h+6GCQJkHovfx9sWPB
         QubA904KAYzX8i16ECgXRQ8cWnKJ0WfuTQEwN9+ztYAIUg8CsUrrAHcI1nu6KxSYjtrM
         XBr6b1S9BOcfjuxqH0pc3GzdhcvFIFbyirvwVbuX0wj2j1LRzGBnsVnVSbwu0DXabopU
         wIps/Gf23APSRHnXleQcpHE+wV5ilCNg3kFDUCtB6/M33wFyMyNo0IOWj23XIMFuIAOo
         C7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389586; x=1789994386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/gngp4hf+LLp5p9T8vhJw8mUWabD83UKmDRD05jdnY=;
        b=DfS4p5uErOciPiaBsfu/4V4GxFm5H8Equ1b5RSSthqx7DiGH103WhSWGaXrK+t9WMD
         /buWSr3oMF3hgNgCeNQP0NgG5LCZMXcNmqB0/JMfhBWNv0qeWpnHskf4cUdS44ZWDIn9
         cEbbNTJClT4Wl5XFigtRDD7A37kha0FL2E0S4Bt9f/u/+POci5k0U923zGWmMC7fNlUn
         xiSRL4mAJAivB0WsAjlIKxh0UY+wf7pNP7IXPCAe49VwW67sGrv3Mxr3tjMS0jgI1dXY
         RkCNmFJ8GwNd21zaoRft3evyGRi/jggHRrzCZbN7BC+m+bgqCgo16N3YRZox7O5Jcxgo
         N89g==
X-Forwarded-Encrypted: i=1; AKwUvBz+oMp8BUe9gJreCR+OahVDYl+b5naJU2vKu0+AvTr8KqjYqlp/KcIuWxshgIvmj+5s5Ng=@lists.linux.dev
X-Gm-Message-State: AFuF++nc6fPTTPDTSP2Vv220/HHj1J/itP4BqUISqve83f79CXzz+ibx
	acS6ujnDgvjJtE4jboVC8yHz1KKwQ9QhIRx9PAXQAaqQ1itZjh4WzuPv
X-Gm-Gg: AYBFou02cZF6mzFS7yPKhzdf1wxCk2717eq7dzXx5guV7Q47Xnvnv+tGCNrVz7nAWdH
	nFRwRCpZxeI7AW4UH80KVy/dUAnprbeyY2uEUuvnYSNlTW2llMN/dy9zxTseppOc+AMJVK9x/pA
	L6CEoo6Uab8AhwbW7hnGOUmKsuMI/KWV0dYCySiDS2bof2wjSYR6/i1ObhB0wzwNY9UOLMB4v/V
	EnFnlFwqoNirxCCHZunPF7nL/9MaWeMX+z1hsX3SinZQl/zInESiEV9Op7wmNDrjDERvfiq5lEt
	Arp1ZAi4pEkgbdjJr2S861yxFbtf5i1dJEDmaSxF8vhdbaD7M1e4lp9CIodXl8oyc5apILoA6E7
	GW+vzSOakjJCETOPDn6erxrfUIY7MnEMaZP/JdpLnJHQWxQBHGef8DdbfAIp/oiQqBSYRPPcF+V
	1+ABO8W6sHVJQckWvpXGXoseRlmyPwfeEXgjuKU4Sy3zdLem40Z86Xc11nCKtYAOZ+SqA6GMpBv
	rJn
X-Received: by 2002:a05:600c:4f41:b0:49d:38:afce with SMTP id 5b1f17b1804b1-49e7a6868c0mr31405635e9.22.1789389586006;
        Mon, 14 Sep 2026 05:39:46 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34f353sm26035194f8f.26.2026.09.14.05.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:39:45 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v5 1/3] pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
Date: Mon, 14 Sep 2026 14:39:44 +0200
Message-ID: <20260914123944.149806-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CAD++jLnmgKrmUnyCx8dq9yFuJxx68Tt-3XPz0WRzOO8F7805OA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

On 2026-09-14 Linus Walleij wrote:
> This looks like something I could apply separately from the rest,
> can I just queue this patch in the pinctrl tree?

Thanks for the reviews. If it is all the same to you, I would keep the
three together until v6 has been looked at; gpio-mmio depends on this
patch to get correct answers on Vybrid, so I would rather not have it
land ahead of the rest. v6 goes out this week with Haibo's comments
addressed and a small pinctrl patch for the CONFIG_PINCTRL=n stubs
added. Once that is settled, this patch can go through your tree and the
gpio patches through Bartosz's in the same cycle.

Best regards,
Mehmet
