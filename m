Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50F038E5E8
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 07:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634830; cv=none; b=L2tmmJ6lFczWXLJPnHiCCXRezcOD778/ESi9Q2n9lXkQ5tA443gt2FOCyeg9bCNLK1Ds1BD8AJ0gqun/R8TfkPwsuBjINHDNAGqghr1ElV5PHPek+PxojEUFWu7KZUp3mj7NBUH5vVMuNIgB8+gMgrxVXQ0INlfB3ZXemWwHpaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634830; c=relaxed/simple;
	bh=q8YBRRsDu2bvLGOzr1v72QMsI03TLtycld+RPAvbQBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SZonAh6zOcC0y+KTroImwrpo+tda/wTz1nIXm7ak+zorpYtmhIul0K7oBni5G1i3+8y8Z9XH2KVmK6a5b4bovnGbzBaU123SN/HXUDiJ7VlB6PtnvB9mzTu/v1Jaq3PtnK8+kfFQAvO65TrnL2bFBXECah2QPmo5fV1EJdzSTHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXvTPmzH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXvTPmzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3119C2BCB2
	for <imx@lists.linux.dev>; Wed,  8 Apr 2026 07:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775634830;
	bh=q8YBRRsDu2bvLGOzr1v72QMsI03TLtycld+RPAvbQBU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LXvTPmzHaW/5Vs02f9Za6DWrJXFtGqCcSoY+XXRcOdDWMFXHhSdKkMz39MTJd7VLg
	 qOC8k67f6IGGCBbvzCIqvEGPn4rHhbsQl8TiKtk+291ifcTHjch0CpCHzQtERjucRI
	 u5ZtAgLq5DPh3iiujmLg/YYj083yE2JKXgspaVHjNzeokmBu36yHBpEqO+wyftmbKi
	 o7j+qPt6NJVp4pC6q52/U8OPLUQDiwPfbJlHK+tzNf92BkWbT6yx7vV2QG2dxJ0W0Y
	 ohtT2wGN+vJEkpUjr5GtBiMQ6fyJpljsZkeBZ6IiI7H6bBARJBn4Tf7PIlBLbscMdH
	 q7mvBas8LCIeQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-797ab169454so94964887b3.3
        for <imx@lists.linux.dev>; Wed, 08 Apr 2026 00:53:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWH6P15iHQE8tNQL/AYPh7oIGCceIpDdYu3zxFMViGAMI890fh8sImh77yKU7gaRort068=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzor/+Z9HIUaILOcW3gg0hMv9EgA36SgXveOZkq9NvIkHVaNj0j
	sZoElTmyQIPb86g9n4Vuj3tjehUoKIjMifNXavOztW0NsECRjdbRvWGZmWu9MJxp1u2tESxjghf
	/7f7ZL0TbAyXgygoXhgIAhHSVhi8Z8gU=
X-Received: by 2002:a05:690c:7283:b0:79a:167a:c0d1 with SMTP id
 00721157ae682-7a4d6732033mr193822857b3.54.1775634829956; Wed, 08 Apr 2026
 00:53:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260408050702.2454661-1-Frank.Li@nxp.com>
In-Reply-To: <20260408050702.2454661-1-Frank.Li@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 8 Apr 2026 09:53:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLnm2gKYJ_0-4Kc054vVttptaSXAAPw55fw7P9ZY9uZA6w@mail.gmail.com>
X-Gm-Features: AQROBzBXWgnoGtug1OYbD9vmYnolAwjXWvXAcgscglqcDfH8q0_m24dir54JH1E
Message-ID: <CAD++jLnm2gKYJ_0-4Kc054vVttptaSXAAPw55fw7P9ZY9uZA6w@mail.gmail.com>
Subject: Re: [PATCH 1/1] pinctrl: Add OF dependency for PINCTRL_GENERIC_MUX
To: Frank Li <Frank.Li@nxp.com>
Cc: "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	imx@lists.linux.dev, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Frank,

On Wed, Apr 8, 2026 at 7:07=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:

> Add an explicit OF dependency for PINCTRL_GENERIC_MUX to ensure the
> generic mux support is only enabled when device tree is available.
>
> Also fix the stub implementation of pinctrl_generic_to_map() by correctin=
g
> its last argument to match the non-stub prototype.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604072013.aI84l57L-lkp@i=
ntel.com/
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

I just squashed the fixes into respective offending committ, then
re-pushed my immutable branch.

Let's see if this compiles fine, if so I can merge it into devel
for v7.1.

Yours,
Linus Walleij
