Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039903932DA
	for <imx@lists.linux.dev>; Tue, 13 Oct 2026 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865122; cv=pass; b=dfnJbxIGkGoHKQKZrBUajIuE+2HTPA3qEBOFcB/SDkFm1qrKjicm340K4UqfGjO34J1A2rHHqW9CmpjRelLSIo9oUleDZda3K9n8ak9C2fKEvDm43EmA+wOjcG98QVqUFAdWxzJmIqnshFFjFZtKJywp5C/q1TtTsIN984xcxz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865122; c=relaxed/simple;
	bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftBahvTLq5QCZ11RrMwlvP8JSkMeSvwu8b0pDc91Y6ACeL+49igD/mBS9yRg6niCmuMfj4BuhGZ6pVq2902sFBKENpafVas+uRjjp6FLZOb0lNT6QkBIM8pPK6FnC1pCjdoqdYgTC4sjAVrayOL4FpnhHAr0huuvGJmfAGTTW2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rA3kN58n; arc=pass smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rA3kN58n"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc751eddf25so1437493a12.3
        for <imx@lists.linux.dev>; Mon, 12 Oct 2026 21:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865120; cv=none;
        d=google.com; s=arc-20260327;
        b=K54TRkCqLzv41Z2SBuoJjcWs/ChMNVo0ZEp8pByskFlKCIMpS8kf1GxTj7LfpP708a
         4wiKVjYJO6Xt8X4pcRRrNB/RlWvFzVc87bFYoJ6aX5u+LcI+1CH+2NAeLReHCYAjR/yc
         DrMkjeJ1LEHyvHL/913oreDRrIRp08jVBAccX8MThzOcYbhtIFWpnDM9+7kdcaFAVgAu
         ZTJD1ni3elDCwOhmCcKQgWMMQZpwOkZKfnkFy4uSXIkEcYJ6F9bKpdnxXyT84laiADdT
         GRkhC1s3kPiL9MT208rfc9iuqIm55UjkDb5IaAyvOhUG7OWGAA+y2AW3CGmvRb2rDw4R
         +4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        fh=myqxa0onV8TSqQKXw0VAgXMQwethrW1RPqtbhcF6TYI=;
        b=lP8jSFtlv4UkYsGoxeo2pzi1ZcfTPR8KPfwiLW8VSAxGVwTU+iBNeAyIRFAnm4LqjU
         qBkvXn3Yeustwo+qq2wvWlWJ1cBw2qFprMt/A7TEe3Is/qIH9PHSWArDY5wTKLG5ftwv
         4Ng/gO7f3yqYnc7ZvJWYquelWbjCoRDEZ6U16lnXNlRLL14wZR/0HzO6w03dWzEIAm+n
         rxOTF9QawVRJhQMWsTZ68EHPc1O+7PaLDhZMIFk9R3M4ljmYBFRByRVhI5USvB1zCesy
         aXCGe++URmzZl6mF7o9gHcE9l5IqfyvTmGjxAfStKp2Ud/ZwMDgA5THDT4kg8cvQdPcw
         MzWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865120; x=1792469920; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=rA3kN58n6WhWWCSJ9eyxQzNQxvdalF7niTq9VVMun/fvqel0+sK38ZFMEQtefDcaCk
         ScZVjjwLJDI+CknTAWyw3wddU/L0QJEceys6YV3kajUS0BSIt9askWJDaJiftIuio4gA
         WOspe0kUveeW5NjfHta1kq5ls7QCwddeDiXpKmWG8d1H+HxCllmBqfY3f572qRD/wFhs
         v23dk+VtveFUveNdAXmeSlFHa5Q62/Fk//QzCjwYlhqw74qFvs3v4ce+3Vt0O2jocGwT
         khU5II8M2iKRU3mbuHrsvmMXD3zMeh0p3q7ogu93gE/DtrTBIc2VYXrzW8AoMaekq78l
         WSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865120; x=1792469920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=bELnJUNhLtvnLjh9DrRB5PURl2e0GMQuTJ3hCeZXUeFccEhfd0t3dmOyLXWlUdQ8OR
         eONU45E3O9FgJbVt1ujJE8MaCgiNNzyafCjWsASJRtc6WTCzTWLR5qCx3x/JjzEKU550
         mxqrFvtvobNt1h4WWV0nsTo4+ENcEF+zjTNYotpshDyoUbGzNS6gIr119rLEAMd7RJZH
         HseDDno4XHwJvuyM2qK3yQdxCHMnxfkrLki8tDtkklNz5uEDeJVbU30JNIe9poANZAt6
         ICqwKPNAyQ9m4Va8YiSiPw8HaXKBVKlFbkx/GqNGC2eNRTgXD/m7Y+00OYCMhDgLLEs4
         KZ7w==
X-Forwarded-Encrypted: i=1; AKwUvBzsJaDYTuZpryeXFQkyj25FYDOzFFNg3Ou6EHhznWstAyZgRgUcdBRfGbfSCcLzmsIv5Kg=@lists.linux.dev
X-Gm-Message-State: AFq9FYLuEJEUYp+V5FSh1WaK35ug+xrHGh29shV/HGtBSQH8jno0d/bV
	XTw0PFbAlJedVp8a4zRCOKCANkDotVsYuK/2uTr6DtNKnTjLjHsq0Nxna/mauIErLD/3HR2VC13
	GPzwezpVpFRXqOMmPPQRQD95fhs11NIE=
X-Gm-Gg: AYBFou0pV8QH9/QCi+xrjbo4UgJOKEx05kO45DFyV+rSDfVkMLgKdKHUkuf40h+qpWU
	9lJzhjtfntCg+Nbk2zYdF0elKiVbaW/FJvr2ylAJGng7RGuzsKNCODRVaL9RPmCNcrz85UVmaB9
	GJilXLoXq/wyj8lU0ott08DmCCGrPUJIZNn6JHEtIFZtt7dF2Hvv8JSI83xpfCazQ16fvlEfhlX
	KFAxXe0FfVPTNgfbjB1UlKWKl0lDIl9M7HQQc4u5bjnCENK59gNwT+pjIZ/JhATbQ1Nv+2UbwMl
	CUHBCQrxsyzDbxNOARxroH9M7zqwM6dKDUnzSj/UDSMx82VCaJobOKinjB8XdZRpCD5L8vAztRK
	H3NIAKl0uz6X+LLo3+rblx+Schp8OPyvQfb4h7vI23GJpp+vVm/dEsRaqIFGsLPtJU7s=
X-Received: by 2002:a05:6a21:4eab:b0:3e0:de06:126b with SMTP id
 adf61e73a8af0-3e16beff287mr10686193637.66.1791865120247; Mon, 12 Oct 2026
 21:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 11:18:28 +0700
X-Gm-Features: AclHuK8E-95w9dmy_Nn8Ii2RGxOq8D0J-l4YT38o4WK2kAtoUqqhMqA48tZbgYk
Message-ID: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

Thank you for your review.

>
> If so,

Although I don't have MSIOF hardware, I tested this on FSI hardware.

I added a .close() callback to fsi_soc_component and forced fsi_dai_startup()
to fail to trigger rollback in __soc_pcm_open().

When fsi_pcm_open() returned 1 from snd_pcm_hw_constraint_integer(),
 the .close() callback was skipped during rollback.
When it returned 0, the callback was called as expected.

>we would like to have such comment to indicate such background,
> because it is not intuitive for people.
> Otherwise, someone (maybe me :) will return to the original code.
>

I'll add a comment to explain why the return value must be normalized to 0
in the affected drivers.

For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
so the call in msiof_open() seems redundant.

Since the first call succeeds, the second call should return 0.
Would removing the redundant call be acceptable?

Best regards,
Phuc
