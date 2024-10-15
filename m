Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3161F5852
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 18:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729018700; cv=none; b=KLOUs8QR0E4uwCxqxNX9miK4+ILKJyraIbjP4+cqWEMbcTkKerVrFLJVJaNE4Dk7zdBYrPbOo8MIqCOLZbkSdPmvGhm74EIBG4NkC+1EzDMuBGbnnncCUorUYaK6t6txFaPs9WL/DUDd6Bykx8mfbPm0O+QVa/w2d1HmWtFKL0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729018700; c=relaxed/simple;
	bh=ZjqiGp0bj+NvwU7B6mmFLsuKUZkeVnU+4eHPsa2EBzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JaOSPEg4VUFaIXi02bN1fHKqMHLTCV1yRb/Ep650pGwJIFrS1TGMBVWNGTIV+fmDUiogrxegjP/YaEN87R/o1CAz3sNokHYGxI9ozn9J5F0jNIrrknLipdM++8IN3JYHm5lTVAgyZGt/VqyfSHlykWSDjvl8pfUvcAIIvOkXkzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TtFcaoR+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TtFcaoR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5635C4CEE1
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 18:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729018699;
	bh=ZjqiGp0bj+NvwU7B6mmFLsuKUZkeVnU+4eHPsa2EBzE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TtFcaoR+aVP+J0hnIJgtQ3lqio6ivLPFln1dEkOCWhenXo8hSjQ0IlhEoZXbzzgKi
	 WzKul87p6iZhQoM4MicGkvQcDo67RBYSmRxt6bYbqCzm+wuadF41c0ryWxDKLhD1hT
	 bFpg+Sf+7jnkDYBxHYVPJ+MKgfXfkDHTZNXUb1fpy80O0lO2cJJoesoLrghPJpFOXV
	 ehbkSxdsODL026a5SgEnXDLuvlAC+zE50eL5QQw6AKueNmt88CUO+9ctdICxe3k3C3
	 +rv/vzJRJnwMK/y9KBk/sOPrpW7fh2QKPKyD2Vp7H/Eu0grduCLs321M72Lkn3atx9
	 s2YILATZdB42A==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539f1292a9bso3373023e87.2
        for <imx@lists.linux.dev>; Tue, 15 Oct 2024 11:58:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXbFY9jn77hGnNa9sVCLGRzUnBeFKz4ezbAKjWDfqF++hxySGIoAOaOcurHhOSSPVPUy9I=@lists.linux.dev
X-Gm-Message-State: AOJu0YycdCNvI4z3FgGAdmsjAzPkytyIhYGFCxEslnKmj4gpyAb4JdCR
	3CRpXTJf+w1Vt83fNw7TYZB1gxZXVNTdJpta7wfBtwwG+3u24r0BkeKgqI984cDA5XZCVRzqJiB
	b3lDsR1D/W53MKWZWbmXorFF/iw==
X-Google-Smtp-Source: AGHT+IHkkm5bMw4k3U4hArlnSreaKl/mJGb5HPD1RKkpSUkGXrbr0rml8iZfYZLX59yuK1lgj1Fv5ddxye3/AwhrWkU=
X-Received: by 2002:a05:6512:e85:b0:539:ec29:1cc3 with SMTP id
 2adb3069b0e04-53a03f2da18mr1016189e87.30.1729018697767; Tue, 15 Oct 2024
 11:58:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241012073543.1388069-1-victor.liu@nxp.com> <20241012073543.1388069-6-victor.liu@nxp.com>
 <4a7rwguypyaspgr5akpxgw4c45gph4h3lx6nkjv3znn32cldrk@k7qskts7ws73>
 <07b47f70-5dab-4813-97fa-388a0c0f42e9@nxp.com> <dvcdy32dig3w3r3a7eib576zaumsoxw4xb5iw6u6b2rds3zaov@lvdevbyl6skf>
 <90e0c4ac-1636-4936-ba40-2f7693bc6b32@nxp.com> <lcogrc6uztckwwwsuag5tlk5otidmo7rudsl7zshe3wpfot3wc@ziljns5phhfe>
 <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
In-Reply-To: <20dfe41f-7aca-4321-a5e9-5c6b8513b400@nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Oct 2024 13:58:04 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLK_90n0xnrwDAymLyF5uKPqmfjg0XBU-1DSrWRi35ziQ@mail.gmail.com>
Message-ID: <CAL_JsqLK_90n0xnrwDAymLyF5uKPqmfjg0XBU-1DSrWRi35ziQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/9] dt-bindings: display: bridge: Add ITE IT6263 LVDS
 to HDMI converter
To: Liu Ying <victor.liu@nxp.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, 
	will@kernel.org, quic_bjorande@quicinc.com, geert+renesas@glider.be, 
	arnd@arndb.de, nfraprado@collabora.com, o.rempel@pengutronix.de, 
	y.moog@phytec.de, marex@denx.de, isaac.scott@ideasonboard.com, 
	biju.das.jz@bp.renesas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 14, 2024 at 5:01=E2=80=AFAM Liu Ying <victor.liu@nxp.com> wrote=
:
>
> On 10/14/2024, Dmitry Baryshkov wrote:
>
> [...]
>
> >>>>> My suggestion would be to add a single root-level property which
> >>>>> specifies which port provides even pixel data.
> >>>>
> >>>> That won't work.  The LVDS source side expects the ports of
> >>>> the sink side specify dual-lvds-{odd,even}-pixels properties.
> >>>
> >>> I didn't notice that these properties are already defined.
> >>>
> >>> As these properties are common between several schema files, please
> >>> extract them to a common schema file (like lvds.yaml).
> >>
> >> I'm not sure how to do that. Is it obvious?
> >> Please shed some light.
> >>
> >> Only two panel schema files are defining even/odd pixels now -
> >> advantech,idk-2121wr.yaml and panel-simple-lvds-dual-ports.yaml.
> >> Maybe, extract them later when more schema files(especially for
> >> bridges) try to define the same?  I'd like to keep a low profile
> >> for now.
> >
> > I'd say, please extract those now. Adding third is more than enough and
> > should be avoided. Extracting is pretty simple. One patch to move the
> > definition and descriptions from panel-simple-lvds-dual-ports to a
> > common location (e.g. lvds-dual-ports.yaml). Leave the required
> > constrains in place. Second patch is to add oneOf constraints to the
> > ports.
>
> oneOf just sits below ports so that single-port and dual-port
> are documented separately?  That won't pass dt_binding_check
> as the v1 binding has proved that warnings will be generated.
>
> > port@0 might get the same oneOf + the
> > dual-lvds-{odd,even}-pixels:false case, allowing a single-port
> > definition.
>
> I don't catch this.
> Below snippet is a draft lvds-dual-port.yaml.

Please make panel-simple-lvds-dual-ports.yaml use this.

> How can it be referenced in ite,it6263.yaml?
>
> ---8<---
> allOf:
>   - $ref: lvds.yaml#
>
> properties:
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/$defs/port-base
>         unevaluatedProperties: false
>         description: the first LVDS input link
>
>         properties:
>           dual-lvds-odd-pixels:
>             type: boolean
>             description: the first sink port for odd pixels
>
>           dual-lvds-even-pixels:
>             type: boolean
>             description: the first sink port for even pixels
>
>         oneOf:
>           - required: [dual-lvds-even-pixels]
>           - required: [dual-lvds-odd-pixels]
>
>       port@1:
>         $ref: /schemas/graph.yaml#/$defs/port-base
>         unevaluatedProperties: false
>         description: the second LVDS input link
>
>         properties:
>           dual-lvds-even-pixels:
>             type: boolean
>             description: the second sink port for even pixels
>
>           dual-lvds-odd-pixels:
>             type: boolean
>             description: the second sink port for odd pixels
>
>         oneOf:
>           - required: [dual-lvds-even-pixels]
>           - required: [dual-lvds-odd-pixels]
>
>     required:
>       - port@0
>       - port@1
>
> unevaluatedProperties: false
> ---8<---
>
> --
> Regards,
> Liu Ying
>
