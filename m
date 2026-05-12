Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C043B994A
	for <imx@lists.linux.dev>; Tue, 12 May 2026 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599285; cv=pass; b=LkELqmJ5Nid3XtcMivrY50GUcI9ufA0FNdPHnZxjy62llpX/DEQH+R64f1zCmwdv85na77a63suFz3EpNXFg2fnMYSnuuBs1cHBE2CbCWVq7PYr9sQu1jyrPToRA4enZ8x0q3R4irL/0vO/VQxruQumvUq9Xj5U0aXPjkMhlL28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599285; c=relaxed/simple;
	bh=d6Ai2oZGfRKCbsGfMKcyIjj6RolLAPQ0oieRpFAWaes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuBDKHtBk4hleL0LAk2XhkuVfeIVP8d4No67p6jBycWWi+u3QbpENrMwa2Z73v0OWSKLCnQlmoABnck9LaCwSeAQ6dMKjm63rB494D0fxHx5vl3zixR7me5aztHmLsJSAl9efxGw5jHOAVt/qmAzlI5cqKddyKd9X6dpNmkCTqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w7kkiBrW; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w7kkiBrW"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-67cac5ece75so9320159a12.2
        for <imx@lists.linux.dev>; Tue, 12 May 2026 08:21:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599282; cv=none;
        d=google.com; s=arc-20240605;
        b=PfpqAxHHs2vMxPTyT12Q79Rwx8OUc3ZsE/7FKP3nYWKaPL9NUSIFwznI4ApwaZbWGS
         Bf63+7HwG4+sjjkhS9f6JGdoM23OcGFHFIl5+aMZ9DW5cFvEsqrnw2EXi2V19iaHeYGD
         amONQ0IY560r4ZlQktm0+wgFHBN00z36S866E0jCAFml3bOlybp1to5B1qrYliB5iIwT
         jOqjTd3VvfP/RGujGo+seFtnH89nVnAeehxofCixW8uGRKfAZqFpGi/0T/YnGvvvSR12
         9HLICu2Tc7e4XlqZdOFMYUmF/zqSP/NSvRSyga2TkfM+o91MWBV24xzNt9dsHfBrdmnK
         mGNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        fh=B0FM7uM1Jte/EYWaP0e4/G/RPcGgVLu8zhzjnsI7iYg=;
        b=gVtPIKbCFVGBRgh7yT7jeZsoC/2NByzWtoSFHvysql9W5PXIKEuH7MQ1TcslWXV6GW
         B96+Byp31GYsBoKfBpauU1p5av+R6vy6YyFBncQo5YXBor+UgKaQqpJ2uP5KDp6Xt/Jd
         zyem6c1HvPW24ToH626+8ezNP1NnsFqF/62WNkb5Qj+5d5S3cSUAVXBIxoE+jJx19qE4
         Bz+I5NxCspPtrOr84hjkScVgXkHTkGjqr8YheTBYdX++A8RZ4CTTlPMti7o6phvi9x/G
         Jp0jyylsww7z4o9hbIyOZ4KCjFp97RKsbqDG8QuDVcuQShnL4m0ub6zLhfgICn8DJfDw
         w7Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778599282; x=1779204082; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=w7kkiBrWBOPkt1Bw3CKDT2I83abYIJKCnGiV9opB27OW/125zUnxfZKU24lbOyTNG1
         CVkA9OUAtE+0Eg+Q7mxjKxbcq/d36RDKtAccoN0/GDEiqolnt82EzWfFt0ZszXQK6z1B
         lsyJ3KAaOgfCxccgRESzCH7UDjM2zRoU0UnQUEX+NR3WjYn5+NtfU6w9nE83goCJ0R/T
         YLxuxnhgZHO334go3w9lXBlicP90dGzHpc6pM87loRxLTy91nn4EnxmAWSGe621UJPeF
         NsY92XltO0URmMDmt5Z7CGit1eLU3PK+xjFGz+YaCvJyU91aGpilPEKLkp+vEcq4KRtM
         lQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599282; x=1779204082;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0ujevqgQXDHfoEPkvrwGuNuwg0PASas1+bZlJQ1jQU=;
        b=tYuOpHGujN6m1W8uH72sCMdDSGSZU2KERND37+jCSXXs5X+EmHkdQdT3yUJMKBjNXZ
         nbtfdxKLaavorw4NTRuVp+3kLoVdYCKt00pjXBP14hMedlXILP7kiWH14C8+R8/WqZH6
         KQr7IEPi5N2I3G1F1WQ5k/DN2PPrDvazQ+y3ukXMVucEJRAdADqx7/AcCmfdBX4AhmbY
         5Z0Zke9+KNjDB9f+f3WaypWoYMPQUrucLOQfZ1NApX+3WAh7Wx18+nK8iGKf/DItJ0eZ
         wUPhLVzXvocOINg86kycTupn0AM7atnKun9ZO0SCL1xeRMPewctVulpQXA9Te5q15OPH
         iBxA==
X-Forwarded-Encrypted: i=1; AFNElJ+iSEPqoRTY7C0+mPpEbbGgBgUaqOMrT4aMZHIejs3Kx9IS48fWnuKAHc7ZPmtnkA9UvYI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8dzLr2BB8rhLGCsC7IKRBKw3///aTrEDgW3IQVphtFgtxaIUP
	kWkjVHqGYGyOhwDCJK5nKf2yjst/kL61MYuly5yMHJd8evfPYTlGEfKzmwiwzYdN6MJqInCFTM4
	2sCsxbrYdTuJfevLl5G6nllYv7moQXRpiTU9e5hos3Q==
X-Gm-Gg: Acq92OFKt93X5saxUUHKJFXKpwgqE5TBYqRfyE6cc4s4++vflLG6m9lp0Unkrc4h7tr
	ckNJgyNmPdROOVmHgNd6b18GP7CbqVGs5b1ezzHZ5USS7hK7u7lSfAo43ykJfVPKJVfcV5oyG+D
	9olkAA0sfaYsu36wlIG7vxsKEcu8K642rZKFOY+G3jR74ltETVxXgsgqxPBSe4w2I5KHhfm7cKS
	5OY2Zh3BdM7/0hhZvWMunrdHkUbXxWLgIBiQJz8HXPbd9e2zACOjrG3DKo+QSCfE/J4EOQXjeMM
	D3/LU9PYudWA66x0t+jvetJJFB9EodpFI12KJLTyVA==
X-Received: by 2002:a05:6402:4315:b0:66e:8ca6:e79f with SMTP id
 4fb4d7f45d1cf-680cf3642bbmr2086182a12.13.1778599281971; Tue, 12 May 2026
 08:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <472f85bd-42c2-40c6-abfd-b76924797069@ti.com> <CANLsYkzt9xUczxSU28u-TfZAAjr0ufZKXAj8Eqfq=45gufXW3w@mail.gmail.com>
 <f7ef3417-eb84-4467-ac72-a9bc8b0c81e8@foss.st.com> <21de8440-adf7-454b-acfc-06e50882e075@ti.com>
 <4c526816-b127-43e7-86e9-eee4dc1152bc@foss.st.com> <c6f68ab5-271a-41ed-b285-75b739f1edd6@amd.com>
 <87850f70-5275-4393-941f-d01146a9cffc@foss.st.com> <da3b79b7-9dad-48cb-b552-cf6df445899f@amd.com>
 <08c815f5-ccbe-404a-95a1-a549aac8a55d@amd.com> <CANLsYkz8HpM_8eS7DjN_jmYs4T7P9xY0jYmdiAx5WO=_1zvFpQ@mail.gmail.com>
 <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
In-Reply-To: <4ae35920-2539-4b12-8dea-efd407b8aaeb@lunn.ch>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 12 May 2026 09:21:09 -0600
X-Gm-Features: AVHnY4LT22IVt808sLwJL3ajF9BoO5QglODlYYWO0TdL8CMLNQDb8uF-T1sOSus
Message-ID: <CANLsYkwBk0KbN-k9ce+5=oT+scdZ3nU5AOr3Fz4zT=0AFzghDA@mail.gmail.com>
Subject: Re: [PATCH v13 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: tanmay.shah@amd.com, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Beleswar Prasad Padhi <b-padhi@ti.com>, Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 12:18, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > Arnaud, Beleswar, Andrew and I are all advocating for one endpoint per
> > GPIO controller.  The remaining issue it about the best way to work
> > out source and destination addresses between Linux and the remote
> > processor.  I'm running out of time for today but I'll return to this
> > thread with a final analysis by the end of the week.
>
> How many of the participants here will be in Minneapolis next week for
> the Embedded Linux Conference? There is even a talk about this:
>
> https://osselcna2026.sched.com/event/2JQpx/building-virtual-drivers-with-rpmsg-key-design-principles-challenges-trade-offs-beleswar-prasad-padhi-texas-instruments?iframe=yes&w=100%&sidebar=yes&bg=no
>
> Maybe we can get together and decide on the final design after the
> session.
>

I will not be in Minneapolis next week.  At this point I think things
are converging into 2 main takeaways:

1) A serious refactoring of the protocol to include only what is
available in the virtio-gpio specification [1].
2) The specification of GPIO controller number in an extension of the
namespace announcement [2].

Shenwei proposed embedding the GPIO controller number in the
endpoint's source address [3], something I'm ambivalent about and
still have to look into.  I also have to read Tanmay's latest
comments.  I'm hoping to be done with all that by the end of the week.
With the above (1) and (2), a new patchset will be required to reset
this thread.

Thanks,
Mathieu

[1]. https://lwn.net/ml/all/afjyH5JT0JS2j0L5@p14s/
[2]. https://lwn.net/ml/all/afzIABSh1xtMEGbf%40p14s/
[3]. https://lwn.net/ml/all/PAXPR04MB9185BFA6E7375FAD0B15B021893C2@PAXPR04MB9185.eurprd04.prod.outlook.com/

>         Andrew
