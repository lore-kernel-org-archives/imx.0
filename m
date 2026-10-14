Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0671049A3DD
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978160; cv=pass; b=hAl0m4LwLM/ViBvidtvBc9RdZ50UFglZ74urwDAwSH1+RdPgrdVcbgU/safJwaxOGEjPwEYugK6bxEjjlCGxa+c+BKq4d5JJ7DK7SDQSwThVJjg0J1XWBb9Sf8Jpujt8H6xkPSKV717Cev24RlWdyEtvO8ETSZRP4BBa4MzqUcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978160; c=relaxed/simple;
	bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGX2VCcy7fvW9yUTOFRAcxwrNKUBvG+xBqK4xC9mmu2xNG04vOvIVcmZQ22Yaz9MB7VagagtG5/zyrIX2dVx5Xyl0OuFD2wVCL+N19DYSNsevxPxIVL6H6VT5bvZkW5Xn/xLurAMkWyNN/SY8eRROoNWaOIFYdq5yNbwR+v3lEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I9gU2yB4; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I9gU2yB4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e812e2b31bso22118265ad.3
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 04:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978158; cv=none;
        d=google.com; s=arc-20260327;
        b=nCvWwKFf2MBG7T0K+6IUfm6XTveWgpspDGIZ3rllGnSyqVZ5WsAjLfG5hMar/mPnyI
         8lnW5ajcaEfDUhLMTHAXjiQLg2aiuLCJIVEEyp2Keyur1WaIDPTcNJ0NCqIrISvD0JiC
         1rrcBMSm+gpQ17J2LaVfmbzf/fpNawa9KeTWznkcfjeObGCK45O4DIDxlH8gSVm71jlz
         nNo9t+kqRnAIznPip4XotmB6qhVv0RhD6K4jIc2JThwoWDO7OCyNVLBTV02qD28liBCZ
         EY6OlW+utg8rl83Uy910PDwU4bqffSP/N5pNeyKFsxNFDGG6zFrHVWPqDtrVZffNqWTx
         8ADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        fh=17g2iuLKBjRyMlzC/x1mZJd7kY9aTMZ2En2pJqwm6g4=;
        b=QEca6uBaesiZHYltCYoPmjSK4TGQTOoXMXFLHSQcAPdes3qtE/mWz4Sc0I7bsJRduC
         sWUdPAVILifu/nA6l6t2NP9MCVbsLXac4fPgMDQ3zgiz2imGZYB39kuvVe+S6zk4GBq7
         SMK2ybdjr+XJlmUQI2K6dD4zYTBtbR06agmNQTRNQgtk3Mcs+fFvkX5X7/PT72/QzTMH
         AJpwt4rE3nAL+n4iFRyn2cwZeDVek+o5OF4UmkbKTz+iJjeTdIiarW38aNZUZS7YGdIR
         xq89P03MutgpIH4Kn7A3ItEhNNYqSv22GGg/KcqE7T96g8/zTWt8nbKs+lyszFcJKrXx
         u3wQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978158; x=1792582958; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=I9gU2yB4q1JUABIIm2OW/CrBdDgu4X6mdHbetIMDODTFlbBhd+3Zb7hWC61kR3sg1a
         KI63QcpebwYICqg4cG5BAl5IdxnorPquIUer3mmFlXifpzvR2EgzmBNx/ctMcAMLUEFa
         jiJbdsg2Xd22ymuFlD86w0lzecTUEQ4WglBQnJTN1kQuaUbFhRlOUiaC4sjLyYfBlD7Z
         D95FX03VKeNjPOBvhYM15u+kqg6A0ESyerWid4ubQAnCiS9vJsyL86ZKvfPzPwRowTg5
         0VKQRdMgqwDmFB/QXY5GYHl64Eu1CCcHmuDE/TPJJdQSlFsUyigDg7SrJfkuZr8XKiKL
         7VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978158; x=1792582958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=z3uccSdx21GfRKbiN8R5Mj9ZbriPWhBo5B1dPyWf5ZAbhIW7vFcH0RDFOxkW6asAvm
         PLcROqxLnlKoJGnF9QxzuTsyooZEBeQF3ZJE7s+mWceSGssuZmEmEhcEAdTA9CIAGgTa
         93TgTqInbmFxe34trYqcHQdZIqsq7gH016xqOsOXHvNI517n2yQRNogL8PakT/MbAMaV
         k8hdFxheA8YTv2NTAj857TBTDlUGsSynN9eUtCbVCEvMNGTi0nvwCSPv/TvIoFp2wqiy
         roQ7wDq8oZDT1TCVvBowuMKEQq6XhP2pObTA1fcDyyV2ltPj4DldITqtlLbzbeZGh/7a
         JdQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxZxIbj7b2vgYCmQ+bqxHVyObRmtxlZ2ExvqEpnYjZcOYY4zA6nv0Xd+OBv82cbOqVx1bE=@lists.linux.dev
X-Gm-Message-State: AFq9FYLXnAEGwVjRU/10jwPPSjJLI+4+Ueygd7fIq0MMulIRX5vZ+EDp
	Kio/ZI4OxpqgzJ6I8JWa2bfFg+phH42PUoT/E9KFsbpyHoUS6/jogWypFtYkh9OighSVqRAtLyS
	HJYldAL/LIpA2Sr0ppLcvk6V4Kfq93ek=
X-Gm-Gg: AYBFou094EJOSL96qbu3edHpua4wRwDPtwpaQVTj+7SDhpn00gBE4ZOZpQ5FsfIkWTq
	2fxAzr4ziDvFpm2sGlTDm0N+tDJx1zeULxNBo9O214nsdlasoEWflpl+P5N8NgRZGtpbhR8/v+a
	QSe7UVx04lNeumsEiMOq9SsFr9ayJm56UoBD/jmFIxjjli/Pw1gAVOVApROKjzjsy7BvAHak/M6
	QXe4KSImk10fXIEy8JJbdBHplr3+IASfL+0PIylST8Pek0qNL4h5UYcGBzT7Sf+0xPSWzXE+bCN
	vSZxRjixCWo9s4KvCkoseBcprl9Vws1BAMinCXhF3x+tyq0fLoyF462cdYIxlBYKutupP5WwRWH
	BUjkMN3t7+14A72xgL/1N54RoylDXkg+MALRjCFajGJ74DDP2qS59pHwAuLzFrnMENxU=
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2e8427efd9dmr151731365ad.5.1791978158291; Wed, 14 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com> <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
In-Reply-To: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:42:26 +0700
X-Gm-Features: AclHuK--pm1YXW-dAVCk4mePmFKUqLdOhzguEaV2jSOsxf_MJ7HFDWxjeVZGb_U
Message-ID: <CAABR9nHyso5GHpc5Gg-KLF3hJkCHQCYz_mK_i3_0fWDEimLEtw@mail.gmail.com>
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: Chancel Liu <chancel.liu@gmail.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Liu,


>
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
>

Thank you for your review.

Best regards,
Phuc
