Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DA3537E6
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 06:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712645553; cv=none; b=H+AexAdQJcsY9jfFcpIDw6srvgilIiFX0QNcLwQSFd4JeDl9TEnOZgAUhRWAXbXb5a65/hlr8zl5VJ85O8nF7AJvNLaVVf3XHzUqudtd9F4kDRQ8XLEPY6QHOjbuKACWP7dYPgivXfQD1eKLT8JbfTYUaC/rsx9rqj1vyUko7vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712645553; c=relaxed/simple;
	bh=xoULbzlytF5RGrLomSCcvTJXxEPOJ61JtuUKMiYDaX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Vls1WuvJ6kpTx3+bm4gPRFwbY2PZCzNEKzPgaZkBhiY6YUGExqxeLm/Mx67eJdtuVXT8ruShTKlIfLO8xm+MvMM5y1sLc6wLjYlQi8C1Kw9ui0+TCoEh1KNHtyAw1sIOoju3Uq4gCAu5lGHGDVJIFH/dnr1Om+LO7thJAvpkG5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOQznDb7; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOQznDb7"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-36a302e7cc9so2475525ab.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712645551; x=1713250351; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b352HOzGF/NbEGXGXSDOWNzIVRBqY7hL8lL0mia73U8=;
        b=gOQznDb7Y+BlCtx7MI4jP2wpNQRaizua6DbRmilNJpTEBxBU/Yjee8UC5j3Cxm0NY6
         cqPB3yTYNh+16anceJJFZ6aXNsoeeTxTp2468t4bX2LUPVSutHeZLd5t/7LFlVEly/Un
         3maAdWE+J6jV/3/rnSxelwxhQx3szo20vm0JI2KQP6KiZs/BU5/WLoMUWFaDbS24dQKh
         ndm9kYq3sicWSooHuCNsm4L3IC8heF6//Zb5sdmzEBZcNZNS5PqYPNmbS0XyfeZQGKjK
         usP0LiQ2ZHXDLPRBqXSJLdAm+o2oKymUyz0Mj4/B0SAXUChF0JPOYRdWvn+HRBpsaXFK
         0hbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712645551; x=1713250351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b352HOzGF/NbEGXGXSDOWNzIVRBqY7hL8lL0mia73U8=;
        b=wuhgWpgopXEkZhG3Ek1uEBRniLOUKNIlSkTzfCAI7C7GHKeBA8bZIsgsNVuIMPalD6
         XWnRxjkHtRQkLCv+oyCYDpEJh6KWmQnPQhFEjgk6ZU+NtqyUWePZJ6SFmXPWi1lhRY4u
         G2zeE+Z6rtD9e/Z8cNIuSZVdXzy3dd19P5cvib58B2ZOb7y7VrxEVh3EOeaK5MvjY45p
         QMx2f1XQQFgJvlQYtrpOU+ADiYgv8F98VynD6PLYq2LlTzk6CP0FFDLVy90zzjMf/24b
         XGhow5xv1g2pEh/iuNCGKO9J7GcXkBRMs1ydUZjMv0UfgSRhDoOI2+CW56nDBE4usu9Y
         fV4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXswtsCWG61LkIUs91A4Rdo8bCJoE6ihBghBydtGE58yH3dx2NGc7uWHbNorKmn+wcvMqGfB02ATz0TP2h/rFVcKw34
X-Gm-Message-State: AOJu0Yz/y/z1ytLJIkQIV1ZwKRrLWH6kfJBYMFh3CNA1yLxBxqK3IL7U
	oNhiig++an9vJwGzYrjqcCtYrGxt7nrhXDefX5V3YJ1n6vmZ+Bzszpiys5nktinHr4EldhDW9QX
	V8jkimWzzZEi5lCRKiLbeiMkZPYg=
X-Google-Smtp-Source: AGHT+IHMPxlU5dxKgUHu5K8XuZe+qftwM2k80rxd63c4T1s7URnjvCONzf8sqUJd4pD7fgxGFHmmOvmrnrNpio20lb8=
X-Received: by 2002:a05:6e02:13a8:b0:36a:2351:60a with SMTP id
 h8-20020a056e0213a800b0036a2351060amr6153201ilo.25.1712645550968; Mon, 08 Apr
 2024 23:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
 <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org> <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
 <69ab2bd9-401a-42ff-90fa-6600dd071722@linaro.org> <CAA+D8AOP6D+xUNF_XJXt-8dMi2qFyVh-Sbe8k67CzvUbnzrwoQ@mail.gmail.com>
 <51e482b3-ffbf-46f9-972d-875d106c2474@linaro.org>
In-Reply-To: <51e482b3-ffbf-46f9-972d-875d106c2474@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Apr 2024 14:52:19 +0800
Message-ID: <CAA+D8AOTtCvsaU4efkEq-7LwSACzuP9qf+e5KeV4OGFgU7OdBQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: dt-bindings: imx-audio-spdif: convert to YAML
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 9, 2024 at 2:30=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 09/04/2024 03:37, Shengjiu Wang wrote:
> > On Mon, Apr 8, 2024 at 11:06=E2=80=AFPM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 08/04/2024 10:01, Shengjiu Wang wrote:
> >>>>> +
> >>>>> +anyOf:
> >>>>> +  - required:
> >>>>> +      - spdif-in
> >>>>> +  - required:
> >>>>> +      - spdif-out
> >>>>> +  - required:
> >>>>> +      - spdif-out
> >>>>> +      - spdif-in
> >>>>
> >>>> Do you need the last required block?
> >>>
> >>> Yes,  one of them or both are required.
> >>
> >> And? It's already there: that's the meaning of any. It is not oneOf...
> >> Before answering please test your changes and ideas. I pointed issue
> >> here and you responded just to close my comment. That does not make me
> >> happy, just wastes my time.
> >
> > Maybe I didn't express clearly.
> >
> > we need at least one of them (spdif-in, spdif-out) in the node.  which =
means
> > that we need to select  "spdif-in",  or "spdif-out",  or "spdif-in and
> > spdif-out".
> >
> > So my understanding is that need to use "anyOf", if it is wrong, please=
 let
> > me know.
>
> Third time: it is wrong.
>
> Can you test the code instead continuing this discussion

Every time I change I definitely do dtbs_check test.
But There is no error reported by dtbs_check.

But finally I understand that
anyOf:
  - required:
      - spdif-in
  - required:
      - spdif-out
  - required:
      - spdif-out
      - spdif-in

is equal to:
anyOf:
  - required:
      - spdif-in
  - required:
      - spdif-out

best regards
Shengjiu Wang
