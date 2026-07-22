Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB135200F
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 12:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784722544; cv=none; b=ml/yMiU3w2JBxfHPWJMqEr2HnZ4FOCyx+Ad+z1a0KCdQbMrby8sSoWZJGk2NHfV3QK4W52JN860X8i3DEFOq1q9DOITNJkFFZaLMSyiw9AIkQGnVRViTMP4V0UB+v+iMC5pV6i/T5uMCULWcGtsZbJVDEjnuC0y7URJe8jQqC2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784722544; c=relaxed/simple;
	bh=acN2SioKymPMphwah7G6Xpi3rWtRZy2VkznOhyDmdEI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dviUTAd6lmDgYHbN3D8NpkDpJzUNuRYG1KS8gzjCUivFFV+mUVkCtpqv0FXioxGg6xJvy9JAtJB/PtBCtzx1gBA/iOqt1CN+I1vIPsSemggsjkgd1+oiHF6AUh5f/0vDneLsmfo48S/OoY6QPoWMzvCLY1AC+yXJOP3WI9ichK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q9aY6Mck; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q9aY6Mck"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so91049195e9.1
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 05:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784722541; x=1785327341; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTe5FAQJLLQHDH6vlAa82uTTEPb2slflxpV33H1nb6w=;
        b=q9aY6MckqXRHzv9L3/dpCZV79e0RxmiYlPppWDkhXrl3jpqIhzlewnmqIYiso8iLSb
         H1fJeK/XiHTUX5nyg8wQfC/+uCXNYHnZwfYLC3pXfgu7VJVQu0mfvesztcbsguXnHtov
         qGX5/UBhfzDTOmk35TRnay/u3eX13vRBrQJiNj6ld3s5L+j1tViuEA1XBXYlM/hQNLPr
         zBCJIqR0ngbQqtM5EVN+0SyUwZ31rpHfLc19017/BTu+We2dHJh3LkBJSkD0PRsNgvRi
         bFSZ4JhK0x5LgqulwcU1xYvHMAUbUbFudPV58q3CeB/pKQsi0JVM7ThttwwI3y87wRt+
         9chA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784722541; x=1785327341;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTe5FAQJLLQHDH6vlAa82uTTEPb2slflxpV33H1nb6w=;
        b=c+uVfz/qR8+D0VIU+Limsn1RSXTrQ2veD8i9oL4Hh4R0WfeNeSFvMZiAKm15lXuqHi
         +Vr9AIbvpIEjVuRgJEJzOBjNPEqexh7D5jViwgUmRppm1o/oTh2RqC0icIRlW5HxZpjI
         uYedEfIQrcDyNmbjbG2Z88E3aT/9yQCcTqSW9Z8j9tPOYbLhBYVGqYVWc6up0hvvzs8x
         NiqZ913ltmIx6k4TO5Cnk2j4HBfHTV7rtCs/QkCGbf4pdplhxaZ2u/kAsjlYTiZLiwqU
         A2KAUzsgyDzoaFhlFPn5G2If5mq5nAbocTJK3egzoZAsXp6aV6tFyBEFUjlZw7/t4XH+
         gcpA==
X-Forwarded-Encrypted: i=1; AHgh+RqYnPnZikSTYcZKTXFnZ+xNfMpBKRqU8xtyMFx/x2JKg41PtB0umQAnjW7r/uKCrKATHOA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxhsiiP1IxURA21DOTAusSNLJ/N11y+15yx4T+KLr026VBVM2kz
	ietv5+99s/YHo/wW85HzW7yk2eJGQ+lK5yvdXQCV1PyeLGoWsIso2fCnWyhLOwZcynQ=
X-Gm-Gg: AR+sD12nMJlZeVe3/TN5lqWQciDU57Ecd166LV0TqnnO1YLl68aC8Ue50ubFIFgBjXo
	rKflL9LSw3DMR1OmHESlXpne1LM0Big2nsZmWVbMgmS8Q+h/1zcP2jEahLtCXxZkpbRUi4Pt6Pn
	BsInAASkZ/iwCK6ex7Df26AjD87azCZ72KzTx//1i+111BQMD0AxITtw+y/hlASDmZJNAJoNKuX
	soQTdo2ATKzPDAPDy2Mr3Uqofe2Z+W7mMMrhFkr7fHOIYx5uO5zXixOt5tM0miEDag4gn8shugA
	4DEtRdR8vQ6UcwTfvml9Pp1czYjfIZzvkjf10hqf6cGGHHHP5VkDbOwJ8rdCV5TAB+2I1FZs52a
	zYqA4xYDQEqQ8HM+Jf355reIYBNFVbC5P7bom5OEt4tujlLzhdQnoZ335+bKYBys7dVDQhZB7Ab
	rHRWrjGiz0ffs/ZhglJ3tSBm4=
X-Received: by 2002:a05:600c:524c:b0:495:4e12:6ae5 with SMTP id 5b1f17b1804b1-4954e126afamr259062795e9.26.1784722540451;
        Wed, 22 Jul 2026 05:15:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f8635c8d7sm4379093f8f.21.2026.07.22.05.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:15:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Albert Esteve <aesteve@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] drm: fix missing header include for drm_panel_put()
Date: Wed, 22 Jul 2026 14:15:15 +0200
Message-Id: <178472247765.1745070.9105161637266531122.b4-ty@b4>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
References: <20260722-panel-fix-kms-panel-put-v1-1-ebde56446ee5@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

On Wed, 22 Jul 2026 12:07:30 +0200, Neil Armstrong wrote:
> Some DRM drivers lacked the drm_panel.h include to use drm_panel_put()
> after the commit b71a623598d3 ("drm/panel: of_drm_find_panel() return a counted reference").

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm: fix missing header include for drm_panel_put()
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/057fad48d7f9f1caa90bd32295a03228254cf1e3

-- 
Neil
