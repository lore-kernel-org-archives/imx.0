Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF2313E3E8
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712689360; cv=none; b=nk7iX7TrcwUyH+p/IfEb7gTqLTLmCwnQ+/6hjjdjBV1ht+GI9AYzp8NJFo+OnUZIJaCgtTbtYbigPcJYNhN6gd9FZzxrt+y58Az1nZsdRlUphPiFws9DgmFZWBvDzDsuPNrW3MjcY5JslTZPSJVUo9I2EBJDkbcuPRGBSNe5Hg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712689360; c=relaxed/simple;
	bh=o7hrAYi0nJ4UnJF9L0FefbB+dczQwLGeHO4S3Tb5hGc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cAwt4jwujhcrVoTWX3nPllckMoiDRYwDbbHp13Ox3fmxjzVwpDU3O60iBFTUQymZHTNHhBCNcwyo61oadzRAM70rvf6d4RarA/14GVAaouWRf8OXI9LEZM+BqwD7HFVKLhfiVTwQRgGwNFyUZWuL2wzVq/EIUCBdc9RI9RKWN/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hbqt6yQD; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hbqt6yQD"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a2cced7482so1629584a91.0
        for <imx@lists.linux.dev>; Tue, 09 Apr 2024 12:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712689359; x=1713294159; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7hrAYi0nJ4UnJF9L0FefbB+dczQwLGeHO4S3Tb5hGc=;
        b=hbqt6yQDKeR+p8RUEW3WDQe2uBCK6BpwKKJ0f4PBECkH04G/ooGLMsEF6AAiUxv/Px
         Rd2ctrpogYmcwwEJS84gfdZarDQhPwyjph4Y26bTBbuBAM2BYvtlIwkFdu6Zj4H/8Wp8
         Ida6FBPAR7qaBulNIq7c2fMsjBqbt/8LiHKj6VlqCddY3H2oyhtPy5N3chu8tViA4dch
         IHWRUZItXI3ClDAFCarHo8pS9BCEMOeqYc9sZtDP0YVltyCMpBHOEEO6wohcHFkv6hQ9
         KMwx84n98+1E4rWimI8i7kxIifwSmG2odqb3V/6MwByf7UPiosp+UP5Aq1ebZ7dC6Uqt
         SDEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712689359; x=1713294159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7hrAYi0nJ4UnJF9L0FefbB+dczQwLGeHO4S3Tb5hGc=;
        b=gGKvkUgQjrfuAgiyEFeQ+jSqznL11EFYYhFQ5xbDp4EkoMGjZ7mumqEvSNcuUGh433
         yFNNhXEY9/nR3KywPYp4OtMGTiq+joN1Xcd4tJeP12dnodQlrX4jH2eL6Vj6OYVaIHCG
         9hGAslxXI27Qvs1PmrzF++g6t58lIxDljEb3eWbkr0828oTtlN6hkf5nOM8t9AEFs6bz
         2lDBxRfVB+8auGuIzYh9poLXj6y5vXEvlh/OvMd0wStO828EoNoN85mM+kYeDANwa1do
         rgsdsTiiF5hwQQCCgB0A8I79YjbzeATjUOcUwzbdin3mj672R2tb/gHtYQsGe347rQqv
         I/5w==
X-Forwarded-Encrypted: i=1; AJvYcCXnKpaF/1aL7Nu+P64W+TP+N9MR+Q4GgyQnTvwNe0hxOAglTVgY3Q6sJASTL6DaR0XM4VlET7gH+RhHTPWaNI4n7D2Z
X-Gm-Message-State: AOJu0YxylpjKaPuzMzd4caqsvTnvii6yRRl9xYUt8MV/81aKrdyCGt1f
	HwDqIo7tgSWExazzjFBhLYpUoYNC+NSEnx6L3vY67z9tPpEYADVHKyfta/P2ghIvqFEDV/VHuMm
	x+voupxr/aHZLtDldxMPyZ0z4Q0U=
X-Google-Smtp-Source: AGHT+IHyUGvGakm/GRDqNPY/mi72SpILHWwbXaseDKMv1qwJ7UytV8j+qA+cMOhsqtA59ecW62tNo+SkRqsULw0+FXs=
X-Received: by 2002:a17:90a:550b:b0:2a5:395e:8677 with SMTP id
 b11-20020a17090a550b00b002a5395e8677mr519798pji.2.1712689358793; Tue, 09 Apr
 2024 12:02:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322145406.2613256-1-Frank.Li@nxp.com> <CAL_JsqLJDhJd_uoL05Z=s3Mc7PRkcJWsQGGjdG0Q0GFp0zA8xw@mail.gmail.com>
 <ZhWP+Cxy9yMAYXJC@lizhi-Precision-Tower-5810>
In-Reply-To: <ZhWP+Cxy9yMAYXJC@lizhi-Precision-Tower-5810>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 9 Apr 2024 16:02:26 -0300
Message-ID: <CAOMZO5C=AQOBkOwMBjkgn9TbQ8242Wj0AEHRJ0j_1=N8WfWYRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ASoC: dt-bindings: fsl-esai: Convert fsl,esai.txt
 to yaml
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, 
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 3:59=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:

> Yes, I run dtb_check for one platform. Which dtb report this warning?

Try imx_v6_v7_defconfig.
