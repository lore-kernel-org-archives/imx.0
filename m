Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644B026AC6
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 17:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723569057; cv=none; b=LjkHg6NpL2YstFOnmaACfbCmodymQtot3iv8OuscMf9R8IGxmz+E2tW12HZ1ZrXMK4h1gEUc1AJ76uqMHRwU0ZMqM81XOMDOEo2K+WJi4Mk7EKb6EyRDTYI8Ihipb7/8+E6raO70tcpz+4pq2YDG+DkMa43rAZVEK3mCQELPoDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723569057; c=relaxed/simple;
	bh=7ympOJZpNt6WSAnm/Uh1NWzgl3X3DNcEPRJW0FlCpH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OTlfwXH9xEBCi7FiVFV1sgRAAm1zQlrQYxt71s2aMDiWkZ85WsOqCwODG4N4/DCOEfR5CP6Od2hpjrucxJEKX5vcJnbVuc5I/ViZOM8ET4lEe04dqJFiakluv2CaiEvOpFUwOkfbZzYBYu8aTPYXmD2+l7tT+EMGexm2rVJz9a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com; spf=pass smtp.mailfrom=gateworks.com; dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b=aStxEiWg; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gateworks.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gateworks.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gateworks.com header.i=@gateworks.com header.b="aStxEiWg"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a7aada2358fso12616866b.0
        for <imx@lists.linux.dev>; Tue, 13 Aug 2024 10:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks.com; s=google; t=1723569053; x=1724173853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhtBUgLnrDhhdGzlxz/BjFJWhCixCkk0gwuIiyZNKtA=;
        b=aStxEiWgjk7xR07UkVRx5SnEWtiUcXduCKOM9My0DysW+JfRcE1ZgD/gQpSSrDTFNj
         2ZFKYfrDnhEhgakIHnv4bn1yvywGj7JOYMok/IhmogxUyklcajxkw4vilG0+6J3XOk5R
         leQU+1MKNBCg0+xyDbffl6kSZrXMIS9rXAGRMwu9rntc4mc317VueHMX1yx5Ae73iviD
         OesgO8v8lvB1CRXwUATrOohYqlWF+WMIBSad9Og5MsqqZ8tF8e7oGDz0vz2HmtdCfEWc
         X1FuSiGR18qrx56Iu6cqtdGicsRpKCP0EGZ7t8qCsTaAuMm+KczZ8ZVTzSvCd8kgrbCP
         22Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723569053; x=1724173853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhtBUgLnrDhhdGzlxz/BjFJWhCixCkk0gwuIiyZNKtA=;
        b=UokzUm1eWH21eHJN2x/ILg9hJllRj0bsmJF6u07eba9Zb5Yc35xJlN+oPro4+Nu0xh
         1kpmm3dJotTEkBP0igKXEgmfiqfBEolgMKHe+4sU8ud7ZcJlL5UP/opL4y4ZZWCNSbrO
         mulie5T1M60q2Q8vhQCZ6kHzyO+6SeM4UOjaa6DhZf4MbLCWgjY09noepuaWStthRABj
         PkYSXbRINiHTOCzC5ExNFijHLgYhtp80S1NP+RaYrYcY/zlT18kQp4KQeuu6xdwWox2z
         ryhObxWBmFdfr41J6SCevUZ1ogHH4Wc5g9QzyjGVjVFiqWxZXmq17iO+ric9Bc6hroSc
         GdGw==
X-Forwarded-Encrypted: i=1; AJvYcCVRHh6ZHUtysesgi74W67O15HIBhr4TT96t4CjQfSMp3tNorN9v2KbnzJ4y72HuRjZkE4CvD3eQrNq+2xBwpy5jtbzz
X-Gm-Message-State: AOJu0Yy/14wiqsHSHALpR40TpWqBLCaX9o9jAVKnZoHbtkNlf38cFSWw
	moUTNqhlzqzDN4vcpuNFRU/OSrJ39Nj3sLIzvjdCHOn+FE9sdhCo2bu8hs/YZKJppVBxRafSkTz
	Uuc5Ajb74XQ30OhAwnhGum3HfGpdbt92QzaxyKg==
X-Google-Smtp-Source: AGHT+IHfrLoNeAHUzX9iSp5yG/DmHNHyvEWlECdWd2S20k6QEuCIF2JQ1mr7dl/AjYpPPWLrA6gS9nYLsHONqns987s=
X-Received: by 2002:a17:907:f729:b0:a7d:c352:c502 with SMTP id
 a640c23a62f3a-a8362d64c1emr33673666b.30.1723569052201; Tue, 13 Aug 2024
 10:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240522215043.3747651-1-tharvey@gateworks.com>
 <CAL_JsqKtc_65tDMFWT0WroNPmW2R0Dd-4Jw101PnyJcPb=7tJA@mail.gmail.com>
 <CAJ+vNU0LBEET=y40BT4OE0zWsu6DxT-SYOrx7qD-h=HH2zENzA@mail.gmail.com> <4faa6881-8828-44de-92fd-6e55495cefb2@linaro.org>
In-Reply-To: <4faa6881-8828-44de-92fd-6e55495cefb2@linaro.org>
From: Tim Harvey <tharvey@gateworks.com>
Date: Tue, 13 Aug 2024 10:10:40 -0700
Message-ID: <CAJ+vNU1ff0c=wJoVTENGSV5Y3Yh_w5mTU-xoA9XgOX-x744=EQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: rename gw7905 to gw75xx
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Li Yang <leoyang.li@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 13, 2024 at 9:34=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 13/08/2024 18:22, Tim Harvey wrote:
> > On Fri, May 31, 2024 at 7:13=E2=80=AFAM Rob Herring <robh@kernel.org> w=
rote:
> >>
> >> On Wed, May 22, 2024 at 4:50=E2=80=AFPM Tim Harvey <tharvey@gateworks.=
com> wrote:
> >>>
> >>> The GW7905 was renamed to GW7500 before production release.
> >>
> >> Maybe some summary of the discussion and how this changed from one-off
> >> to wider availability.
> >>
> >>>
> >>> Signed-off-by: Tim Harvey <tharvey@gateworks.com>
> >>> ---
> >>>  Documentation/devicetree/bindings/arm/fsl.yaml | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >
> > Hi Rob,
> >
> > What is the status of this patch? I'm not clear what tree the
> > Documentation/devicetree/bindings go through.
>
> Always via given subsystem. Which subsystem is here? Maintainers should
> tell you - ARM Freescale/NXP.
>
> See also:
> https://elixir.bootlin.com/linux/v6.11-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L79
>
> Best regards,
> Krzysztof
>

Krzysztof, thanks - that makes sense.

Shawn, what is the status of this series [1]

Best Regards,

Tim
1 - https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=3D85=
5146&state=3D%2A&archive=3Dboth
