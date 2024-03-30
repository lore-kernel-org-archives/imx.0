Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C588E33CC2
	for <imx@lists.linux.dev>; Sat, 30 Mar 2024 17:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711818218; cv=none; b=iTjgRHilcG7E5fdSB+2lnj1sXkjrFMxMisqrfWKuywqPre+pZpnMTyMwkkiRrGDq+BHzzjIv7Qa/V9I4bmBTzK6t89aVRvEh8/UmEPMr5lGeoiFJ5Scdu8Su8TdMCdOD9jPpVeEGlB/JulpY4MVGGs73g0ZUc8EqB888cSogo0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711818218; c=relaxed/simple;
	bh=dlNLMHjgKsUj625j+jFaWWWWiUKiOw29QPF6O3ZOFDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYrZoD9S0nj6FaKfAcQokmRCfdKcc/qS+xhgOOqOeUHk13jIJkyCF0Gwmyt4pPeePbYE/8zWKJOJ0ChjT+kIT7hFCaSNc/F9HeU3UHkboUtzLmrFYSTLO8IT8QzQBXw+HyVdZWZRQyVCCxyGQ5c/KD0UdHPKFSJvYGjwT/5R/gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iuVZq12H; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iuVZq12H"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e6ca65edc9so871903b3a.0
        for <imx@lists.linux.dev>; Sat, 30 Mar 2024 10:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711818216; x=1712423016; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dlNLMHjgKsUj625j+jFaWWWWiUKiOw29QPF6O3ZOFDU=;
        b=iuVZq12HsAUN14JcPYkiffzHo8RVuZ6iKJ8ragp42Pw7EHdzJ1FmjiZeBDIRWAQKPG
         U3fPORjci5mimKYdMnm8+f7TOLpHVjj4LYW7IXDuqGIRiFhE6EBs9pa+3ZBrzK2i9+TU
         AjciSwHVPSL8VctjlqvqIejay3NS86IAfqykHstUaLOW9yNHJhHgLWYCYxUBT4kOHrVa
         ETrWqQXT2Scsyzlkevjwvo/TfcQCvwyw80iPGs+LF3aBMAgjFOE3W/gb/kpXqwC5DsXk
         jqcHgP81CTV75AuiFVOyqPRHMrYy4wC+NCdPMotHyEY8jHi3bGIMxzDLvQ/X+t9rjuZ8
         u05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711818216; x=1712423016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dlNLMHjgKsUj625j+jFaWWWWiUKiOw29QPF6O3ZOFDU=;
        b=YnUP8TS0YZFhGjw3ZoNWCB8HIGkF0mosX6Cq3w1wnyQ+wVTAl6hQjHptGWaSZDtLmY
         wCAIojW/6mT9FIow2KBqKwqdCxIe1iybEgw6x/FZZFEmYDfmUTNE7Zj7wn3m0pSUAFX7
         hO2wdSeOVOE5PyGQq6j3AarZN5eM9Apph0VYvi7SKf2AWn0IxmMtw1Ji8qcjttkAkGmA
         aXKPpLL6193yhBS0syqzwKOaeZxyvneALeVegZgr02UQWmN9GUTwN11J1u7lA94XyjtV
         0RBQG2dHMwLZzbotl1jZk6pbznvRRXnwvE3FHhFZVWGFWQl1fVKFtSXPQ6Os99OPKRwl
         ySVg==
X-Forwarded-Encrypted: i=1; AJvYcCUS3/L014S0MOjRgLLrhyziwx5ERrgmscAiyRHBApaogzi3X3NeIbxpvLAHIhYnxetAddKj3WcSPSTT+6G8xp4NJx9j
X-Gm-Message-State: AOJu0Yx93m2K854na5UwUZhCtKlQJqSdyPKeP8A9M5AMEOCi6T768ZNH
	m7ADyeLe2jz+OGY310t29SAzwhmkgnMqudJpa6aYoxZhOtPdX845jVkRMUUDRDxGm/klzHqJjbV
	J1eS/lQez8rqssORwyM9ztVyrte4=
X-Google-Smtp-Source: AGHT+IGk9eE/LU4ikIwv/kY/RqcJgdHqn4HFXVhkHeSI0VkFJAbbmxAia24RYH0R4yyHXIe0TunIrh3F1mhI7Ek6AeE=
X-Received: by 2002:a05:6a20:7f92:b0:1a7:c66:121d with SMTP id
 d18-20020a056a207f9200b001a70c66121dmr2261069pzj.3.1711818216087; Sat, 30 Mar
 2024 10:03:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240330133410.41408-1-gilles.talis@gmail.com> <20240330133410.41408-4-gilles.talis@gmail.com>
In-Reply-To: <20240330133410.41408-4-gilles.talis@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 30 Mar 2024 14:03:25 -0300
Message-ID: <CAOMZO5AWTf++_129KOsxDXBxe29egPFfVF==GMY+Hse7Q6tm4w@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: freescale: Add device tree for Emcraft
 Systems NavQ+ Kit
To: Gilles Talis <gilles.talis@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, shawnguo@kernel.org, 
	alex@voxelbotics.com, andrew@lunn.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Gilles,

On Sat, Mar 30, 2024 at 10:34=E2=80=AFAM Gilles Talis <gilles.talis@gmail.c=
om> wrote:
>
> The Emcraft Systems NavQ+ kit is a mobile robotics platform
> based on NXP i.MX8 MPlus SoC.
>
> The following interfaces and devices are enabled:
> - eMMC
> - Gigabit Ethernet
> - RTC
> - SD-Card
> - UART console
>
> Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
