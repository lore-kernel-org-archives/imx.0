Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7009E1E5738
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 10:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736246244; cv=none; b=GbnJTQWViQtziu77wQHu9FvJljO96YfUryt8kNDd8UCjMRemGwnn2AIigqoS5IHyYjtSfD9K53SzHIT4iKXW1OAxD2cCqYCq3cP5NHS70ADb1Zg1XO+kDHVEh2ecfvUgHIix6Lcyo+VyikSxdSfsuCzEXL2y0nPWjH2L99BXKLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736246244; c=relaxed/simple;
	bh=RNVYdwGeBEZ8n3x/7EiZLzqJLaDPgw+w3yHRiFecNjo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZYpscr6AXtlBXrv3DY5eTsNdT5Qil1lTWGheGMDvBB/oe58U1BLlOOihBJHxMAffdF1xGhkggaEOBwDUnBjC3BRdxOmujwRFWpBn2Cndawgl8bIe5E27KDG3ZY3WJfu3p/nyA9/Sgxpd4Sub2Gjcdu9pOjAEtEviP1FLhYCf7nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDua2iC9; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDua2iC9"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53e399e3310so17991786e87.1
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 02:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736246237; x=1736851037; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
        b=fDua2iC9qnON6agMMSe7gFTAQhPekupNm1f9EVOjt7PlSRxTjqO2fk1QumWAsEglOc
         m9oKjJrrSN8C4oQehbpmyY+YiNHlK/d8MNh+ZLC7jldT2cWm/EVusetdNzYUEExIqGsG
         pjHcOh7PwoS8b0pqMVa+qHY4Z8FIsk2qG8zr91Dk87hn4ZBi+SlfVHmqR+kdjEe0Q/hP
         2yc6M0jtBv7BVHlAp2fyWW4wBQXZLxp4oH/5Hf0vCgm5Ed+C3hpoxzrwuvnEyHSdRhfW
         cNwlKFbd/Rw85SYzChepww4zbjTsZEMAH+h36ZWCuoCYqszv92Wf5f7qEUO9l2D5TQ0n
         Iinw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736246237; x=1736851037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xje32BOdw7wAqN9VcKNPAq9+7Mpm31xiFrYaEG4gc8o=;
        b=Y+fLhiIDZKtIAJ+BTKDsUxPLUNeMXG+WFhpuVyd8XYoKmqEKP3D6A2tHUWjTSELw7j
         3p4SEv57/i6exOFDYsIDSQb+4UJSNon+R+sxhunVc39BzIrdaNWmxSeb3wpkrz69aaNu
         wZVUS11vXvy1wjYnUWZeHCxgVUIc5YFhvzkEq9OyLWbEKMVvQxlhAkYC3U+DpUypwF0K
         Iw03ilB5bQSV1R3able2Debbfmwt9f6hwL6/ErDCa7UdwGymLYM5/Kv9L7Y8bHHFqEzS
         0sYVkon5dejlJBD/Yj9El+Xwhc5qKW4HL95VRMPLFB7iQY3KXPvuFqAf8BDMcCBxRvBB
         k0mA==
X-Forwarded-Encrypted: i=1; AJvYcCVkjSl5tWjkCcGnt7zBt0cRHL87I1b8kwD9JgE0ITs/hkAUBKgaKEu/JQy8vTrpdnQlAT8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyrUtcERzHjjHaN7aFqzEME6N0nMy/vjhiaKQrNV/Y76A6AddPw
	aHRs7lDWgrOUgpaGfy0pfnEsJ5TI6V7dTeVzDYF/hDDlL0AO6lLdk4GRS6zlRrIKbhr5MGiGmSi
	a8N32sixc832Y7e2Y93Cav/41MrU=
X-Gm-Gg: ASbGnct3aalOQ52KVtfT0rofn9edWiEwugriW14j9Huhp+nfGbZUYOVNO5ywk6wvAMP
	Jx8Sr9HVwIclDPMQnfefkdKIzKeDEWpt1L4esF3weW6MD1cN0A1DaODpVC0Abprz/wKBOfA==
X-Google-Smtp-Source: AGHT+IHS3njRhHL7YfFO0iWHF22sHLsH5C52QKY9UxYlGlYE//joyWAtO538qgeg1ERJpfJproNazJyxMl4X57hOWEc=
X-Received: by 2002:a05:6512:1110:b0:540:75d3:95c0 with SMTP id
 2adb3069b0e04-5422956b7cfmr16752741e87.47.1736246237133; Tue, 07 Jan 2025
 02:37:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com> <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20250107094943.518474-2-alexander.stein@ew.tq-group.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 7 Jan 2025 07:37:05 -0300
X-Gm-Features: AbW1kvZdLxR4RaObsuUJc1Glb-jI0wjh8lFemgvwEzpoXOeKA2MO9ZmwnSRVm90
Message-ID: <CAOMZO5Csc+cOmOaRofWZW7Z9HL6d2NjMhZUdcomuyS_rtZwz0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx7s: Move csi-mux to below root
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 6:50=E2=80=AFAM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> fsl,imx-iomuxc-gpr.yaml only contains the mux-controller but the actual
> video-mux is not part of it. So move it below root node.
> Fixes the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: iomuxc-gpr@30340000: 'csi-mux' =
does not match any of the regexes: 'pinctrl-[0-9]+'
>   from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-g=
pr.yaml#
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
