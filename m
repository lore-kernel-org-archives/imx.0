Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFA88F45
	for <imx@lists.linux.dev>; Tue,  9 Apr 2024 01:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712626638; cv=none; b=uqAv6NUxra0qgUIJ4LbFIfW1NYyyhvVjCaP0E9NTgpirQoZ3T93XAtEb+SazqV+FSg2T1Nu5ZQeNU8uYIB/YDZvYzIlin7e+NBRiUU3hp0k9gR5IbRr6jqQXyyNvDEcF1j7bipXkEp6agerhicWEm6Ae+Vo8MDB1lD2LBcHNgdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712626638; c=relaxed/simple;
	bh=REUfQMGxi6wZBiAigJvmtnxlwEZNsiAI6JDcOF9qSOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SBCIHpfeJtTROvTCPMcnscLCuf/NqdZsHwk1VyrdkXF19xcSU2PUR577GSwTTpELajRG9TmmUiiw60rz134fCERMmKW4MkWkU7UdV8UNCy/QP6+Uuk7x76lvCloOu5d5WudRO3tw5Jz+97hT1zTRPyh7mGk3c1Q3Cdwir+e0PUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPxlyo3p; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPxlyo3p"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7d0486cf91aso271657839f.1
        for <imx@lists.linux.dev>; Mon, 08 Apr 2024 18:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712626636; x=1713231436; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lrU41zZbg4rdCONBXZqOnSqD9/BbJGHGI3UVtCYp1A=;
        b=NPxlyo3pc7bh0IwxToDLNHMMNIFPaCkMsEW5YU26m2sGSeHyeJ9YOfSNM6cbwVXo+z
         /EeS/YW2DceTE5F/sHyfCk6EbvxMD8X1pbOMTPOTXBqLG6gORvgtCOz6ZCkKWYDasgX/
         Oqa96Om15pizm5JdnStZLsWBEuSsAhVcOWKr2+laEQ8wXYLmoYXfVk/HGtZExcxlP6yA
         FqOqcP9i6i5Q+VvvFA42una1lqGvb4LPLiO0Qya7LJUwhk7PoxzPzFdksMgFGcGWWcz0
         mHmFlCwxQTewAg7f+jJRYKl/KGH8HvuVsoSDx3I1oJSViEcMZrEnW+BmmaTj+q53FRha
         WLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712626636; x=1713231436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lrU41zZbg4rdCONBXZqOnSqD9/BbJGHGI3UVtCYp1A=;
        b=gV7gb7/WJqH8H8AHa1+NW9yxhPJvfetvwX7P8QEp5hqSaKjV9s27uQIAWeTtOC+igq
         UH+iELmnchau04c+VSgLW3DyB0VvjCUQqUrYk+nQHSCxAUaLDsxsJlEdF7Mlw198WMu1
         esX/Or2I7V5hxXGY1DrW+cZMI/QO4MbyPv0IPqKONq7WCAAqWVVUsMSzQsVI3T5GSnFz
         eHtzaFk9Zwq+mKFRtZ2igM+YrCLsg79qBS/ebYhuuUIVaBhw+OeNBwcaCmyuuVmkHlo9
         afxlA05ifUAihODWm30F46Lc58qkbcrteVwcYwt4tFKB1UVwO3JSvtjpBv7ccDj6AKGK
         iBSA==
X-Forwarded-Encrypted: i=1; AJvYcCX3++H8HpksSEnq45UlTtT1PX2L/ySbmuaoWJn//a2nLJ5ehwVKDuS+UsjUusbp4ojnGx1MI8YqniDBEeVQZ3qd3j+Y
X-Gm-Message-State: AOJu0Yz/7bbRacMpsBddFfoz3YIIhnFOWjCdVz5BsjHuZhpRBJaDmDgG
	EK8U6RwUAFJJP3qncXIuUfy2LGj5KTUBir48ARxxWk17DhxLM+yxo3u+17VeyocWrfyHekWEY5Q
	U4wYA3f9a7gEZR1+WUhm8LmX5A/I=
X-Google-Smtp-Source: AGHT+IGHBYdqw5WuioZTYaZ1SjiEaQQ73sRjZsGoduAA1jBDzDuGbUyCGX9a6fp37uYrTgH2e7VJ2m+I4JB2tYmbQ2Q=
X-Received: by 2002:a05:6e02:b48:b0:368:aa7a:e25c with SMTP id
 f8-20020a056e020b4800b00368aa7ae25cmr12442798ilu.30.1712626636379; Mon, 08
 Apr 2024 18:37:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1712561233-27250-1-git-send-email-shengjiu.wang@nxp.com>
 <01734d96-bed2-4f7e-bbba-7068f14c822b@linaro.org> <CAA+D8ANiKH7Oc+KAjD_BMp9P2EVeM8Q6dLGFCC8a83bJXUpPEA@mail.gmail.com>
 <69ab2bd9-401a-42ff-90fa-6600dd071722@linaro.org>
In-Reply-To: <69ab2bd9-401a-42ff-90fa-6600dd071722@linaro.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 9 Apr 2024 09:37:05 +0800
Message-ID: <CAA+D8AOP6D+xUNF_XJXt-8dMi2qFyVh-Sbe8k67CzvUbnzrwoQ@mail.gmail.com>
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

On Mon, Apr 8, 2024 at 11:06=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/04/2024 10:01, Shengjiu Wang wrote:
> >>> +
> >>> +anyOf:
> >>> +  - required:
> >>> +      - spdif-in
> >>> +  - required:
> >>> +      - spdif-out
> >>> +  - required:
> >>> +      - spdif-out
> >>> +      - spdif-in
> >>
> >> Do you need the last required block?
> >
> > Yes,  one of them or both are required.
>
> And? It's already there: that's the meaning of any. It is not oneOf...
> Before answering please test your changes and ideas. I pointed issue
> here and you responded just to close my comment. That does not make me
> happy, just wastes my time.

Maybe I didn't express clearly.

we need at least one of them (spdif-in, spdif-out) in the node.  which mean=
s
that we need to select  "spdif-in",  or "spdif-out",  or "spdif-in and
spdif-out".

So my understanding is that need to use "anyOf", if it is wrong, please let
me know.

>
> >
> >>
> >>> +
> >>> +additionalProperties: false
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    sound {
> >>
> >> That's a random change...

So  I can use "sound-spdif", right?

best regards
wang shengjiu

> >>
> >> Instead of sending two patches per day, please carefully address the
> >> feedback.
> >
> > In v1 you suggest to change it to spdif?  but spdif may conflict
> > with the fsl,spdif.yaml.   so which name I should use?
>
> I don't understand where is the conflict. That's a different binding.
>
>
