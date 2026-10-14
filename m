Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1307E4A92EE
	for <imx@lists.linux.dev>; Wed, 14 Oct 2026 11:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791977977; cv=pass; b=rXMlyYd1JCLDVev0jj4MiGBU3A+Lzw1cLqb2lmTwAiYnXGuBzw3dfCGwGLMCLTWXzbF7TCLJj2ugq0yGdYSm/Fp206Oje7Aiz1XcegNUTGn7+Hsv9fmIy4ncbYRzaXfLwsJ8NzJXOZbBZrMS9DAEABXUaD287Y7p8MaHeb4Wp80=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791977977; c=relaxed/simple;
	bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JtiCcr0vSqS+hb7hyJMAN2QjyMcEE2S9KiwlJ270/kfvuhmIAQX7PyjEEG3L+77c8oaaa573UrvgY2k1t2Z7GeNWr4XnTkxnVQy5z2mJEeumpMkOd2Z/KmQbd46fX2vApnFAE/xttKAdcZbthhP4nUWbDl0bAGiXIyfciJh/kqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eriwDF89; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eriwDF89"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2e5fb79ce82so21913185ad.0
        for <imx@lists.linux.dev>; Wed, 14 Oct 2026 04:39:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791977975; cv=none;
        d=google.com; s=arc-20260327;
        b=fFJvMQXBTsIzX45l+PNku8x+UQ3JhL9suUdGRuJvqamsID0C7nN/+E+7HEagowxbOU
         fIAKp7Pb0sUIxElbLDyyabXYp3HaEBJ/9Bx39hiIPssAAv6OItq2/ayui6VHqzbakpeU
         ILb5P3s+q+aoOTZD9pzgEFqCdAY55Rtg65qZrOWKE77IzWp5vxn78Iy8CUd1/hjWurKQ
         aqa/Cso1lgUGAvMvozdYFEOcNChA3jK78ph9z7S4parymHitRnmQGWTweYVCBJgXuI/P
         wSrpYqrleUATZvgwtgIC1DWADGDi+DnwGLyC1W6RQhOhGeFFj1JAvm08HTQWEEvHDlOn
         UdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        fh=mpNRPqutRj+9DYhWr8bZu7IJwS47AM9+U1GgP81TjgA=;
        b=iziUN5Fk+Vzx62/DzSaaWpm11qr0p0MBzCpXu1zoYi9epubv0yBB+qr/15Lm/JrxA6
         kwoc6wx391n9i4BJ8GKAltvyuipuhueQS5Z6XQ/7eDl6/61QsQ1ApWhrUNhz7tnxBph/
         d7K1B4dGo/R8UQgD1StcpWRi2Whc2BhPy/dqqcF6K2ffu7sLjZ94pqFSCkpO2ab4fWIn
         9O5jJmvfEjs2wDbpkCxpN8zML4ZpuZVgqiLeQsl7ywekDUoxYSgvCwyPuT64wfYEWUDj
         L9TUnAky3NaK3gy3dKRL6OltZRPDz+0zV+otj/EZk7e82Te0D95DTiqL2BfXvZx7fkyz
         VWMw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791977975; x=1792582775; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=eriwDF89oyU450sggqluSKSqMT6IAyPCSbSUjzF45Nvzd8Jsob/RE4Tr09b+o1AEFD
         5/7IYtVUcgnCrX9XQlTDgbpXVUVpK2dbF4Yu6cpEpJD+0AFjPZrKy9faIXfeSEjb2+Cq
         3/DKVwhwX8si/iBLaU095YHRGbp8XM04jfoMF7xinK8IEUf3PIMn8gmtXCgRlCReFfgH
         7UyVv2Rm8NOYHiZ8ljA1ObVjBMy9I2+LcqJWVZJ+5LsrgtgLGLWcn8kO6GOl7Tt1dAs5
         IUDXMAOqNObCZTVh40+ZhlAYQw4U8t2IFciTOQGppfsSeAokCEbDMQz06neSGM+cDAJD
         xp2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977975; x=1792582775;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=86HyIPwleJgWRq7xObrqY9hZQITORuKm8Ont8f8xwzw=;
        b=ClcFvf7V48HgZbh1W4oRT9J13TXyqh4ZegnVZIOgg5Tjeg6gauY8DqmrpHD+yQ76q+
         h30QQd/Id6dZH6y8iCx3D+rBMuCXZrXKVAVcYaTt0Oq73L/SzycY583wf5/mBM4XycbL
         MGNGS2q3BQhg3ouduEu1xBg035q3FJhMS0EuuLAQIArSI5zpag22GdXiUOiaVDTX2aRs
         ghdfHeOvAYDfxUL2/axzut1VJHlPUu0bu2fX0KrvgKr1ZPsgcnbVrVjI2mZI9XoPI6vy
         m8P300Vf/GvYz7f4tQD0Fq4xBHgC1GUP6UBSmmnBY/1LGsi8Z8YXFOJo4K6EC9rl3rU8
         rIhw==
X-Forwarded-Encrypted: i=1; AKwUvBwa/Cfjy8qHzFuHZDb72wTLCR5kjJD22Uo5QUULoz4xt/iTPSXMcDCtH+qXcTD4eR3hW/c=@lists.linux.dev
X-Gm-Message-State: AFq9FYKBZWR8iSo66nVYe41BK0NYJ1Z275mIMc6cyUw/1XRGcGfPNXtB
	dAsYDHyxvxI+jG8ZOArBgaHdP+VSurBpiWKSb4XFkwj6iocwnNyI/qRfQirzrA/FIp/lXZl6Nq+
	OPK1WtYBrEfyKa++jm60NltyWAMYzOJM=
X-Gm-Gg: AYBFou1Dvv4LCYO6i/Hk5BPIl062Ai0G+zrAo3AJAqRwxA6+m/O3Nvb/XdxObUshUDa
	7PA7cFq5CR3uiyIPe0713XWJIHlqghh2WSUz6CKVyLVQHtf9nyjjcQshaHoBJQa4C+K76x0i6qZ
	EEl5Czl3db3pNpsQhCj68Hkf9tIpVj5b3Fyxfrr4AoRGErwCRmszI9cKfLvUPylIeXwoJR45hXW
	qEVrJ4sbz3edurLSm+ZsrTwVc6nI0FkdeRo3qf1w+hzBPSiBr21/tbe00rMBIGaXulv6i25z8Yq
	OE9drgdooG69dUdCwdC22vQgSNySdCHO221NKLB6SoZOkG/mjsNHkHOQe79TvlY0jUlwsppwgZr
	f8xtff8L/Lwcf3CXXqNRFvuE5QkoH6kwWzu7V6QsnydqRf2CFtMAo6E6QQYzC6QRvEcw=
X-Received: by 2002:a17:902:c946:b0:2e7:e73e:7091 with SMTP id
 d9443c01a7336-2e842bc6d99mr145871485ad.31.1791977975265; Wed, 14 Oct 2026
 04:39:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com> <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
In-Reply-To: <fc30ea4e-3c2f-4ba4-9ae2-054db9b49fd5@amd.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:39:23 +0700
X-Gm-Features: AclHuK9jgQVtz3xDN60LQFsNWM2GDbLorSH_eG4NihFn39vhGI4sDgE_b4KgxkY
Message-ID: <CAABR9nGbO1tBOL=fN90ZrYPkv767qh_sJG_UHP-FW5C7sBPpmw@mail.gmail.com>
Subject: Re: [PATCH 00/24] ASoC: Fix constraint return value handling
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mukunda,

Thanks for the review.

> > Found by manual code inspection.
> For AMD patches:
>
> Reviewed-By: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

 I'll send v2 shortly with your Reviewed-by tag.

Best regards,
Phuc
