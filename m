Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22BA3D3305
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 13:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768916591; cv=pass; b=aa46KkLI3W7sHmIy9Cl3LFtKv7/zUdkXAkdwprpeN3ATu9lxUxZaaWgJZ1kj1MDIoK9gB+z2S2mQ0yh7dGJ/KZhvhQlzA5TYWB33ZxAVGvPekUMKxImvSYDhoIBSVWYRF8f2CSUZx5emypJHzov/JDTKfLPttKDCgLc11CKDliQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768916591; c=relaxed/simple;
	bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZoA2gqp5bCnVUfGO5n68dbuuqxlfRv2CIz0Aq+GTupAFjoPewF0kR7Va/ePj1ReGxbcZ2IbyvM3kpO+RgOKkm47tn7UIE08vyT78cGH3tqzelY7UAUyJf2PRBqREiaguUCuVWafSEbfFtxgTz2Lg9MopSMX59O9mjZH8B3kpVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9GCXpCN; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9GCXpCN"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-123320591a4so5358178c88.1
        for <imx@lists.linux.dev>; Tue, 20 Jan 2026 05:43:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768916588; cv=none;
        d=google.com; s=arc-20240605;
        b=jeR18d1vmJuT0Kjf/yPVq1yM7ftWB7QPs99hK7f+PyEvTs6fF3EBmzWX7gTnREcRqG
         BZGM8ulN9Kk9hODx1wqCWjRiROv5xC1uFJh4MmiGDo4qUT2oKkT3SFdZTv0hzBvO4ZCX
         Oq4sHufXrsC71fFZMxAIfwclxRN3v82MNBKcsJvJDTrjGpEkc/8ZP2s9mV1IAO+BcOj2
         S6NUg6Cl7u2+j9upsfxk75ex1Xm+6IDRGRJeM/v+OFCd9NTMLVeLNkSSWa1cYsPqNXj1
         8tTxEh2kBqruRuBLCfGe3Y3TiK8mu4s/jK+iJwFV22Yooac3uK6dkoX0zdCRJTu8yA7X
         iCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        fh=uuVLffT0i3thhMFVqE6UvqyKy3x1K8TYPh9KwFACEVE=;
        b=EalnKHIN8TxCgkGyiAn8xyNIy8mGiCqCkSjO0VQnOX/zRwDVkBG9LIgyQOEPhNERhz
         /l892H1BxfGbVPwsFpDgaKC6ctdyjPUcURv7IGGlRh/bowy2Ye/ge4jiWjQrU5syd2qu
         9e0A9RGHeK4OLICEce+nynMusb8xPwTZkr1xHAVckhULmCE62+i1rr7ND8/GnjVko/np
         +jjP8A2P+SmrLqZe+Fvy5b9y7UJoFifLjz5+j7Z7sh8rC4d3Ru6QMHSmstIBGOYhLBbp
         uBQskY/G8Kd/iddq5gWGV8O+u6w2vvDpk8HLYTFNESeWz8J+o5EAZqySlqOr+APr+3Rc
         ja+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768916588; x=1769521388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=L9GCXpCNbAJxyrrIVLCroPHTmQ8LLqhqqcqrS2IB9r552GXf40ku2SARcdUJ2faC5J
         HT6whdEAJoRi5+0+vj+ysTp2fmKl22JDKT16Jx2NjYG9qZzqtiGpWEqUBkE7VDpGjOOz
         p+8pv1wGwAD9qir0AQ3vyjE5Nj4LkjNUT7rDXx2sWW/a6RyKgKXQwiJs4/HbFGclXkIU
         9563ONx6YXRBEyEGD6yPJpwPimJ00wL7iKJTge3jMPUXl0i0bswDUXvwCpUfnYPwo1LX
         XsGUHZqmjCxWMtIxj/UrEQF6F88TCK6XbDC/9d6o14wy+CXp6DLDzmoNVZbLPHc6Dhwk
         2Lrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768916588; x=1769521388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x9mgi3TL0eDGl2pTGxPI5X6I1yeHKcio4o8DKGeuzng=;
        b=UugKt2Iu/y7AvJp+bvLOKkkrNFki84+UsGUEhbagnREwcz6aKEPGYx0Khpc44cnzon
         nahiaHu644jsob6swzW0O2dC4xseb4rNc2EIFmPpYA47K34VKzy9QfPr86jrceHyKc1A
         gzycmSBiwjaDO4qOLgVlA3ouTyRyWLWXZKJO5ztCKMPm3l6Tk1OzUDGiMO3PZdfGbUOi
         Den7IPmifRGM7M8UhdMQqbU16zOjY9Myvva/VNVlYFYURjueX8I72Ln0V8+rb3YxWXUf
         al9wUlxEzfj8y0z7WBrO1xrXgOEh+VBiNIr7MvM74hyvnfpP1a/D/1TNyDpW2o9uo6NO
         RJ8A==
X-Forwarded-Encrypted: i=1; AJvYcCWUj0MWQPX8IBvKAY56WSTduvr6VOw/7wT0YhGXbW2joUDqsq8t47KPNntxDpmPr5GCNw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUya8h/pTG5SqbreQp71isWHMRi6Yn/it7YQ0DRYTXKxSA6oBn
	8q7Wb96dENV4Q8UrK3LK5SBitRr+qiaaqTfNvqgslUN2nk+zwfPqGKHWJZQP7e64tpgHNt3nMam
	KADFwUqJiUSrEToyoYqfh0ukqsMV12H8=
X-Gm-Gg: AY/fxX4nYqkqSCbsw0eX1EaxLTPPJQ+zvXuLl5xFAjinjQ/4T1yhR4rpwQwDYMEvguX
	e9l35TGe5f+PGMTTnrdiG+Szpu0bG4nPIY9QRhgPDK6km9pkJToksKGIjt9jG4hzJm40ZLKpk08
	j5wtvNzJTPUWooLHCTTh00u7CtN3caNSXflBxUhGKzcmW3ycpas+kiD6MyneDWPmmxcJvYxSEyF
	YdcG2Tis+7YHSNUKZsoc8L2PlADwNvstynlWZ8mDZRaJKcB1XRbHtU+WakHm+SwroSYDIA7kQNR
	akIiFqLJZVE7HsC7+mJ19GjKKiEErj0Ipg/x8bbL1txyNQuK5DipxrQGH6kPOPEw9OBrIIWS/O1
	foF+ogxhmQw==
X-Received: by 2002:a05:7022:6b8c:b0:119:e56c:18a6 with SMTP id
 a92af1059eb24-1244a7257a4mr10880097c88.14.1768916586232; Tue, 20 Jan 2026
 05:43:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260120115923.3463866-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260120115923.3463866-11-khristineandreea.barbulescu@oss.nxp.com> <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
In-Reply-To: <CAMRc=McD0cRxtb3RCzzYPewFisto=4OjvA4gjaTcOk8ghTw_qA@mail.gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 20 Jan 2026 15:45:46 +0200
X-Gm-Features: AZwV_QiPrjYIgkrWuZvZ77hO6EmYEBB8e53YvqXAvD3NoIb32l_6NmOignEguN0
Message-ID: <CAEnQRZBNKBpwhO2Pr9Gb4cPPBwXf0bMYRuQzshCMJgOkOJEKVg@mail.gmail.com>
Subject: Re: [PATCH v8 10/10] pinctrl: s32cc: set num_custom_params to 0
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>, 
	Alberto Ruiz <aruizrui@redhat.com>, Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org, 
	Enric Balletbo <eballetb@redhat.com>, Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, 
	"Vincent Guittot devicetree @ vger . kernel . org" <vincent.guittot@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 2:26=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 20 Jan 2026 12:59:22 +0100, Khristine Andreea Barbulescu
> <khristineandreea.barbulescu@oss.nxp.com> said:
> > From: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> >
> > The `num_custom_params` was not set to 0 and the pinctrl_desc structure
> > was not initialized with 0. This would result in errors when parsing
> > pinconf properties from the device tree.
> >
>
> Shoudn't this come as first in the series and with a Fixes tag?

Hi Khristine,

The entire series could use a better patch reordering to arrange the
code as follows:

* Bug fixes
* Code refactorization or API changes
* Device tree bindings
* Driver implementation
* DTS changes
