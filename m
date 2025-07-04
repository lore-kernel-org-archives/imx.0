Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A34635280
	for <imx@lists.linux.dev>; Fri,  4 Jul 2025 03:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751600375; cv=none; b=dWRYpJhaG2fNtQviGumcf+Ojmd6Pa5SXTHlZPW1SvZNaXHdGs6QJuvfhalnWGDyqKKc6TaAgvgJnTm7MLx4N3a4yKImtOoduk4HiJMvyKqID3guGOoYjuaOJbAucBK/bnO7S9ROAK1GKx2Hyr1kEjfpaFjlgExEYhTHavG0QDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751600375; c=relaxed/simple;
	bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dyePeA7M5gdf6vlqdUuK54WE7zcCKKCqpMkY24Bv8YkOXkeWj1NmuUyI+/euIFeM0SUw6uFoDWQ0mQ0qCRF9CevlMCP7oJ62EikX5o7nSmjQP1xVPGIX3V5TMUVXVVYC6XpO03PblniUgUnZteauzCaBDNonAhFplCxsB4D1tH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=google.com; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KlkkKpA5; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KlkkKpA5"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-70f94fe1e40so18991987b3.1
        for <imx@lists.linux.dev>; Thu, 03 Jul 2025 20:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751600372; x=1752205172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=KlkkKpA57/7G6K8T0jvoUAJvOLLmTaSino2juCDu5QLNAaldDMN9R/8V53Gl13ll/O
         Tg7aIUUm3F59EU/chScOhbpUT56MBNa2+EqUWyfMHgvcU9mImhd22zBWsvhB2XqCd7A2
         beUfIc2NAK6AfJTy0Kr+yGVNbKH8l9bzIyIuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751600372; x=1752205172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDt34RbEYo0vqpY00U9ijTPtHhHk6iMis9c9F4GmtsA=;
        b=tR6g3i9AwOxPiBN4KZjm8tx5CQLcJW9WmHw8Aq2UP0IMX/SmywlSso3LX/bwKLVsxp
         jKKwsxDO/ZPboWG2aNKqEhn3uXJ9N6hplZY+8a596aRc28nWGMgnmEJW2kdJ2u/laRbs
         lSGp9sZm++H7vkXJAK8F5w5q+XSDTe6RJ0ZVGvZ4ET+9kFE4i/lD690FweRfVzm0xdx9
         SLH2l7xifoAdCWpCfAEDsdsKZNHkOTTT/3Knj9LzkyGLi7lH6WocEadpG3hfKqX64700
         c8moazONRwjcmY5hQ/Ci04Ddf1I4OyN6W32DKwbGlcC+FIht8QiOzMNHGMEd2l3Zn3G/
         TDRA==
X-Forwarded-Encrypted: i=1; AJvYcCVx+fAfR1HnmRpRE2ptLP30zCOFA6lzSFdc/aKZIKPc6rr8YPtg3pwyOJ4iuiZzfRj/GHw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxrp+9iO2RnO/nLrqFYrp1L6M+nMCgiTuMjMpBfh6vtUOUf2idA
	jF4VXCk6lDQ28/Nmi2xw7IrIYk7SR+fAasF9Dh0bKrN+Vb0Or7cKKwjPPAHN+9WtE6wJVz2ikoO
	ocbrraKSXuKg0AvZeqlqbH4yip4i3hAa6IMv0cqbq
X-Gm-Gg: ASbGncuVkbdpN/zOtPfpDLNAiSPw1WS0GuNR6IR8F8QPyuRAX/5CNbK0gpWDUZVKwJY
	Pf/4bzaw/wJUNOKbjoGCjG1ztbpoIZh4ytnmOcyjgUzpARAuCPY6k9OfEvEMi7DcSxtN/+ELhd/
	3ut1MOT2i5HSU9Acc6Yd6HuHtgVT0sryONBib+9P5s7agl
X-Google-Smtp-Source: AGHT+IEpv4/ABsyEPWBaSbnhDaxcTMMoASH0qOMAb1EUBzfvoB9Rs9KL0TsrqeATirMWAbb6GqIiVFu78+U/gU30DoM=
X-Received: by 2002:a05:690c:46c5:b0:712:cc11:aff with SMTP id
 00721157ae682-716672d3d02mr24980587b3.11.1751600372350; Thu, 03 Jul 2025
 20:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250703183523.2075276-1-robh@kernel.org> <aGdAmGGPDA71rDE3@google.com>
In-Reply-To: <aGdAmGGPDA71rDE3@google.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 4 Jul 2025 11:39:05 +0800
X-Gm-Features: Ac12FXx1clDJs40GrPtAnmhl7h9XO9sxxgXTs_ThD6wPGcXtPD9F4XTO-6ZiN-s
Message-ID: <CAFv8NwJcwD0wqJAoe99M+dQYA383n0g9U+5+Z77uuQ2d=Ac5pA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: Use of_reserved_mem_region_to_resource() for "memory-region"
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, Guenter Roeck <groeck@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Benson Leung <bleung@chromium.org>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chrome-platform@lists.linux.dev, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sound-open-firmware@alsa-project.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 10:46=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Thu, Jul 03, 2025 at 01:35:21PM -0500, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for the patch!

Reviewed-by: Cheng-Yi Chiang <cychiang@chromium.org>
