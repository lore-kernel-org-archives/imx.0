Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B2035CBDA
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826615; cv=none; b=f7/xgwA2Gn0XUH+0TYHxvz6r/sNbhCnA0/v+9beSfaptJ4g71036qIPZpn55tohLMiu16TzsYh3WSNfKFSIRA8/I8ph7rNu23n/ezU98wJt9Ja0Qoy19HZJGd+/fXfFM9LZx5udrxzMW7XhB6QL0gnRAiEdWZzIgA0JhSVTCRt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826615; c=relaxed/simple;
	bh=Djc2DXwbCV0lJ4fSssFOWRnwLtrLyDYVkvyL/nbyTuA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dlMAVjirizyilyxj/uLORQ02wKuZGIi5i1wEv237FcKY8DPdTRH1KEqkLxF76BrjrCdWQWaeRctDZFGDDDQ0rfbOateIThzfDv6q64JUYcVcJ0K9nnuGvSIh+mQgYxBCjHREqKdzcK9H0yXgUCw9lArgmqvZR9HITdgu1fClu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dwdrEI8B; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dwdrEI8B"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12336c0a8b6so9121025c88.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 04:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768826613; x=1769431413; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OHtPJU0DUMKO1F2sqGZCMsKmvXgpAwApi+pqfSny0WY=;
        b=dwdrEI8Bx4i+IcNB5jHb9VL+gVnpxoKidc2MiFpyB03W8QaIS2Jf0UAf8kt4uRt1BX
         XwqJuO7qKGBPNDZpbTKX5N+UpphBMZl4A8qymZ4DbMLnWpgaTysjMYqVPioV+Gg4Hf0a
         jlBii4rQje//4bOmBpPG72UczTUoLISV85b+BqUGYSypivM7PbaRg7XqRLjGuvbP7BGu
         xRcgpyiTxrj4oU9ozjDmHXOgVv7EZz7wpudmyH/NHuIi9Mzf4+ShpTffLx5G9alWr1ne
         3BU7q+6ZmcfXqDo28e3AjZSipdB+kppyAkKYUdIf8zrlJGIKY98JplSigG3pg0lJrdK8
         NNpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826613; x=1769431413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OHtPJU0DUMKO1F2sqGZCMsKmvXgpAwApi+pqfSny0WY=;
        b=JGhjqmdRMTCl+PgikU3TYgK8gM8d7NXWbI8/mzsoHvoOtdG8h4s65ERYdFEFzctbT5
         uyxtDZthnP/1iezDsVfudzlZcJRbNXGrD9CnW5PUu7WY5OlPfww1an3m8Ujp9wbm1UVm
         T6U+foQosIyYok0GxXjvAmZdrTSfHxMBnjL+8tbYLD9sv8MpaRKSQwlVG42wSd07XIOe
         E9uuq4TX2AaFjUxC4Q31uq+R6w96y7De49DaJsVJsKcvqe+Dos8hQma4Bvc+S/b9/GwR
         BkUfUPM63r+ZOVANS9PFn8qoIUosaUOcg6btBNj086gB2hbhPmxQPjZ6x9nF/ANy38b/
         lw6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqBj2BcxrF/mrZ58Nz004GXrcSk87Uzf6mT83IACNYe2bg93qi1r331UPUfSoTUSpqI44=@lists.linux.dev
X-Gm-Message-State: AOJu0YxeD7KQPJyPmtbp1ySYCtmWlN0UPUg8mBrpq47mk9AJdRs5qy2F
	7uD+/MjnZHRUzA0eb8lv//lrp0if5bcW/Vb2ZteYtKNu5mD2auQBHyCAd6p+KheVnemnemUXqYV
	z7dhcCNWmaCvOA9v1IWkNHSEcwB1MrB0=
X-Gm-Gg: AY/fxX7l8C/daX7wzQH7p43xg5vr7MCWkJ2q9WpsRU/Xr3c7JBaRqDvkfNPdWVxV7vf
	lf3xz0J5blpZTEK+zXdqL/0uxQgGY04xTdy1Fc7+pu3PFmnBY16vzy9zRAHX3/6ld614GSas+WI
	vt1bXXCUs5d5GR/Zjmsn3duPWR906nX1/P9X/okv9vTeG0pAPqg7Z8uekbRVwoezDEUDSynvr9Q
	BFdRbhOECx38/KsGVSVZi2nDlp5wVgQyp6xi1aA21fCiVotSGGlnAPPOG+tkdSAL7SwJom5nbBb
	4SPkBIUfY1ucwwn3CAmE7zYbdwkTEF9kc9qpH5ZcBYu3OnX7V81Qh5fIf9JFMHk0Sr7qv+4iQOJ
	I+/2bdwMKEg==
X-Received: by 2002:a05:7022:222:b0:11b:ade6:45bd with SMTP id
 a92af1059eb24-1244a6fa90amr8867693c88.8.1768826613054; Mon, 19 Jan 2026
 04:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260119103411.50397-1-francesco@dolcini.it>
In-Reply-To: <20260119103411.50397-1-francesco@dolcini.it>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 14:46:13 +0200
X-Gm-Features: AZwV_QjtNyiBHeLdUkjbl18_ROfadpDkB4z74sf-P-WeirXN-mnvQRL6Snmf3Zw
Message-ID: <CAEnQRZA9yHGs4xodNZrYP2oto2QhOJXtiX4BFkgNM7RydkJ4YQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: imx8-apalis: Fix LEDs name collision
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 12:35=E2=80=AFPM Francesco Dolcini <francesco@dolci=
ni.it> wrote:
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Ixora boards have multiple instances of status leds, to avoid a name
> collision add the function-enumerator property.
>
> This fixes the following Linux kernel warnings:
>
>   leds-gpio leds: Led green:status renamed to green:status_1 due to name =
collision
>   leds-gpio leds: Led red:status renamed to red:status_1 due to name coll=
ision
>
> Fixes: c083131c9021 ("arm64: dts: freescale: add apalis imx8 aka quadmax =
carrier board support")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
