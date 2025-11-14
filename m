Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADBE3115AF
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763121258; cv=none; b=ctoc15eymUHFIebp46vKj42Vz1bviZqdxqc5BMwHSxNjTu3PfpyVCordC565LGP452/dDj/5QI4kyE4shYE7ypv57f6rcE5nuegQibYO+GQeVxThM1czVFK1mR2Nch9FgMIvxVNb8dtfMu72NWD8xXg+MxNQhzP7dJekf7oTO+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763121258; c=relaxed/simple;
	bh=kZcnPvSJ8D8LhOFwTpNlgBYy4vevqbhzxHjkgH+mOQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ecJFR+3rb4xCdbZbKyjsyJWwXlxi9XGB2+/Sd1bEga4QY/dAOiTntopDl2BjStZkkPCQ491WeKuQbvoVK7+NCH9bVchgGeQg4WFPhZpPr++rWjBdU4F2kIQP65EH7TtBCDk0WOxIjhImN9sx3Ck+fE/Vzrtzrv4uDDvE368ba5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S0KW6Ny2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S0KW6Ny2"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-37a3340391cso16194951fa.3
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 03:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763121255; x=1763726055; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZcnPvSJ8D8LhOFwTpNlgBYy4vevqbhzxHjkgH+mOQs=;
        b=S0KW6Ny2lML8/IJKgFi8XqOz4PMKDn7U+4Vm+8NRsnDEtwGMUxASOaFPwTXSDGx+C/
         qac8IxuUCLK3ncHoDgzc/oWunIO+FNg61XehWs+1Whcht0cOuVVQ1ug9QtQwHwfYcIEo
         RQSvTkjZF4vKQk7MyTqelPas3TlIAIl5LFDeI1aPT0I6hEUBqUqema4TotryIKNRGO1z
         bvD9D6Ny2yHwiO7b7ta0OLpbY3gsew3tHQBzNj937FzVm2igidwlC2G6TOldadvcm8rW
         NbVPLIAYal42lQBkClPnk6ApFPbslEPbxl493DmogLIlpc46yqG5YBm7Um4iiTeY9VXb
         DJLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763121255; x=1763726055;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kZcnPvSJ8D8LhOFwTpNlgBYy4vevqbhzxHjkgH+mOQs=;
        b=B3BcaPQcbEJtW+ws9PZPU8mH6y9yOeW54/inc3jSNQDCvJyY4eoZMQ/gmqWhgAL0Wj
         7UyTmzvNK21b9Y4RswgT5RP7EbrT6CXG2XR3XG11bLllqCgfkQFNLhSRNYXUIi+As8Sv
         jr9YKfLzDQAe8Gy9Ix0NyAokB8uIzZ/Niz5AAmknWIIdUPbj2Wko86nuSFvGtbGyyqd3
         MYoo2X2Z5GKqOzk8Ay8ydd7cFnCCACA1qA4xte9O51lgFlgJCoMwx2Im6FEZIIbWrQsl
         1h1UjuPc9BpsThEHhvl31Wt9mrpSkgJe4/jmJ7YmGKpelcndA6wsrAScu0rpl8at43x7
         SpTA==
X-Forwarded-Encrypted: i=1; AJvYcCW3+iUSQHhiPqUJ4uoMizOsEIv/X2dgxx0sjkrUlV/BPjZgUZvFm8kpmYEwiOm21Q/U6rg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyhc56RIWM8Lx/Ra8HcohNNajHTO0hHchfRa3aYqjpUG5etKOJg
	TcH8p4ZklxhpifxXayKkodFQ2qPFzewSKMvz/m/A7NaNCQOw999AhkwOP0fQAz4a+Bs0HEZ5qnh
	cbuZEnMFGdXbRXrDYUWdtlBi+BIFAhRo=
X-Gm-Gg: ASbGncspyy7RvYjYxxq/4WJrhytKpPkNo9ZvBuMZUt2C8IjuCHOa00OPpSyhDWpkAag
	+7/+2cCpHXMef2Tr9wG0wSQ1V8g3RZUr9vydo/qj1yoHhQqDZwHSkUYvjTZrLd8ZVOX+ssnHI8Q
	W/MuWSvspcTr9b2loPgvjshTWhFoHbfx5UzgRwlUNjMIAv/JuRpmkXPYHmG1VHx6Fj+GAMpV6Wj
	5V2eFyHXTfP+xqQ9LL7IMTpmkbO9AET7RCkOyGDFzIWAx0NhZfILjd5rkAbDmWA+hNC+kcQJ/Zy
	nqS/bhR7hWeKTSMk1BlJS0jF/A==
X-Google-Smtp-Source: AGHT+IHz37vwf8Y7MiFxPOSUJKNInb9OQZLvqDOPsPXKEQSd7we5CPK4KA/Tw7N94FIS3c9idUG4JNwjnxLiGCjTMxk=
X-Received: by 2002:a05:6512:10c2:b0:594:34b9:a817 with SMTP id
 2adb3069b0e04-59584252391mr873143e87.33.1763121254798; Fri, 14 Nov 2025
 03:54:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251114074212.1214255-1-xu.yang_2@nxp.com>
In-Reply-To: <20251114074212.1214255-1-xu.yang_2@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 14 Nov 2025 08:54:03 -0300
X-Gm-Features: AWmQ_bmlkmnY16HqyTCMS24moG3Hbq6h_aRVwrkkwnBpleByWJVRZ2j-qWye2uI
Message-ID: <CAOMZO5DNGKjRLUVKgyziG9nEzPtyRVcPWc21x0wc20ZjuS6E-A@mail.gmail.com>
Subject: Re: [PATCH] extcon: ptn5150: handle pending IRQ events during system resume
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 4:42=E2=80=AFAM Xu Yang <xu.yang_2@nxp.com> wrote:
>
> When the system is suspended and ptn5150 wakeup interrupt is disabled,
> any changes on ptn5150 will only be record in interrupt status
> registers and won't fire an IRQ since its trigger type is falling
> edge. So the HW interrupt line will keep at low state and any further
> changes won't trigger IRQ anymore. To fix it, this will schedule a
> work to check whether any IRQ are pending and handle it accordingly.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Fixes tag?
