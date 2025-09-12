Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB512727F4
	for <imx@lists.linux.dev>; Fri, 12 Sep 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757667522; cv=none; b=XDRjNXW9NaySXqFpNA5CCTggKlS+FijmCGEXe2NenGV7XksFMReH7X5KQwwnDkZ9YeZtAVLu+O0l9uOMtPm6h+EOvmqzun9BUXm9ml7IVzRooexuWuzBN8I6q0jbYFDoraPeDJRYZQx8KMaUu7G4vz+CaUESG6VUrFHVqE+7HYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757667522; c=relaxed/simple;
	bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cPcoCEyjDu+2VmehcI515xf82GroGDbmAfqJMCGb0YeWF+6zH+CXy5Xgur+RRBpQQhbg0yzjGE3cu3RCnrWNUmjWnZZLbgzJNjeBIntNjGcHrDyAbBlU1YGaJ2GAxsX1t4wvFSXZXoeLWJ4SKsWaxED9C5J5YNY0/+axelrMpBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSlEYHs+; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSlEYHs+"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2445806e03cso19110735ad.1
        for <imx@lists.linux.dev>; Fri, 12 Sep 2025 01:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757667521; x=1758272321; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=dSlEYHs+2psM31XrztvLXmTQsh9VeB9mcEyRHPHD8DyUcUIvIPa4L8BWW1JVWIlg6r
         DfFpSnYikJQdjqiv0mPrQsT4a4eaR+9CbPO0XvcB0ZrIQvxRTgQqB7CFAkYKvG5fS6qo
         gB1ITvCHpRpMiwnRiY8ec3EZvdRGGG54WLfsqI0xkHEdgxHbvNr4yozbwEHxZVNVDfQF
         C/Cdy2P7qe3QVnQQzcyO45dfjw5jDpm4Rsr35kve4PfSbYu9BIWwtbAPGV7qQ/UJ1aDK
         XsSFGflU80czmoMkYJUGO4nura/5iQI5KbHRO8qUBIorxsBdsRlihL14iW7cyUmytqaU
         h/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757667521; x=1758272321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ro8PZYwRD9DQ2WA2wyE5JTGfo06TRzy3FDdEN0mwaow=;
        b=tuKgsV/byrZm1fVEAFJiGagLeAmHnLTznIguSRlKLV1cP0iNKmTZosOuZu3n9QBq2e
         BdFRf9IQzYUa1QN08BgvpsLYgvebC51N+jgciPot55WZHyeuLZklbvWFakwPKYdFLwqL
         yjoiILShT6kgt4nej1LXr7IAfnQ0RJjKk/U8/QUIr1aiJxJIV/Zy597l6Pzf0bER4UR5
         E9aHIoXeYBF35WFLdp6jjdX049OIFLJWARjwvhTKSrWm/hwol+QTIrYaR8P7J+EaZSjl
         imQxIjpXWRUCl7qV2rXErWP697w4n4YUnM2EeWjU38UJxsKVi9ICI8Q/FrDvl+egV1+a
         A9eQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI+kjrZiPjp7ln1OvLj0aQ4GOv3T790TeXFLtiyhuzAJjrlNFdbKej/5jFsbO7g21zRDc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwntgJyfUSSjj0UMuD3FQvh47rAyn3BsiFrivugPL0WM5ORlPJU
	Z2OUQAq0YJBistUEKEpEjjdE+7YPg14/E7jr+elbxxPzQ0jfQCMzUJRAJDD5YzCCow8XTMshUz0
	8aMyei6YhAtoR504hcgMgw8j2W7OYVbs=
X-Gm-Gg: ASbGncv9Eo7aY8V9IgRmp/dIk7kkOznO0uN4baNnLM1wiaMMgHJYFyHMxebRAFZhbth
	v5K3Kd3wY+853BkgUKZztzlvaI9dYJgnkoKn1P8V5iV1TIT2e3a8ZEyx0GGqcwctragcLGfWw2q
	kvp11LCG87Yh6rtI3o3bL5MUYbLhxSbDiCTmW/oB868dlcOThJRbaYSwXv9eMb8vzPe66wsfcb8
	fc3J6slwYfg670CtSPpj0N24JKDXKGtRF0zg8P1inn7mBBM/wS9uxTlK4s=
X-Google-Smtp-Source: AGHT+IFQRimSGNTZUF8rsCECFnkgLkqZ++YXJEJA7EhcHsbtO0t6DFoZ5dfeGu/99EC1Bwvu0xIa9exB4T1QYyticTg=
X-Received: by 2002:a17:903:3888:b0:248:9e56:e806 with SMTP id
 d9443c01a7336-25d24100ebemr28596975ad.12.1757667520671; Fri, 12 Sep 2025
 01:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250910-imx-rproc-cleanup-v2-0-10386685b8a9@nxp.com>
 <20250910-imx-rproc-cleanup-v2-6-10386685b8a9@nxp.com> <aMGe/gwmFqjoFszg@lizhi-Precision-Tower-5810>
 <PAXPR04MB8459CABA152B6C1C122B35F28809A@PAXPR04MB8459.eurprd04.prod.outlook.com>
 <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250912061120.GA27864@nxa18884-linux.ap.freescale.net>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Fri, 12 Sep 2025 11:58:23 +0300
X-Gm-Features: Ac12FXwYlGvGgqyGXugiWWObiJmtXxlEmnlZ40W_NSnxtz2WGuiuVYkoCU-Wo6s
Message-ID: <CAEnQRZB-yoV+BYsM-9CvmuSZw_8EF3ijtZhqtBoJOoyUc+-pSw@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] remoteproc: imx_rproc: Clean up after ops introduction
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

<snip>

> >> Can you remove 'method' in data struct also?
> >
> >The method is used in other places and other purpose, imx_rproc_detach
> >imx_rproc_put_scu, imx_rproc_remove, it is also referred
> >imx_dsp_rproc.c.
> >
> >Could we keep it for now?
>
> The method could not be removed from the data structure, because it is also
> used in imx_dsp_rproc.c.
>
> I have a few more patches to do further cleanup, but that would make
> the patchset a bit larger. I would like to see Mathieu's view.
>
> Mathieu,
>
> Do you expect me to add more patches in V3 to cleanup other parts or
> we could keep the patchset size as it is, with further cleanup in
> a standalone new patchset?

I would go with this as it is now. It is easy and clean. Lets always
go into small increments, test them across all the hardware we have.

Then we could come with the next patch series.
