Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B077014A4C8
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 14:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720794630; cv=none; b=laWg/NOHs6fGh+sJElm0Kw9yFBV9VOXNNoO5eI3NsHXh2hQ/HUPL8P6NV0Sfm0bI7mxZo0EebIcixAuchI7wyf2yoC91cuv5NIpkyZSbB1vG+26MR4ydC5bJZCnReTvugjhCnjscAqyTdQc65jaqfxGVRD08rL0ZIYX6V2Ap+X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720794630; c=relaxed/simple;
	bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxsN2uWG6lhuBlQUUGz1TBHHBMRdI/XfecSWduHTxSMOmXwOgeEDA/W4zQ9yq7kpq7AFJfhN9Lm4krY46RMSykyNd1qknHcO89biMvibuZTezDER/0BietA4iaJ8aValrlAjTUBYgkddhzmsMMF+1+KzSef8uBCxNX0LgSJc2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YTrTsKKG; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YTrTsKKG"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2eebc75b36cso2314381fa.3
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 07:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720794627; x=1721399427; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
        b=YTrTsKKGOBslH1KKbjdCnwdpkHaMLCNOi+I4GJiblRj282FYVTAgP6530T+cBq4y34
         We83RqlKBtS8+rdlmZtIeF6yPiDqLwxWrIDh4ny608ngWytZPnyBfInSPnK2Ri31FtTe
         ICEP+MGlVxxbta9b+m9ZQuEn0At7Nmw+KocCvgzKZnbJYA95D+hU4xEqpFtK/7Qpzmj+
         jGTDCk+F7go5a2Gio2+1G3cx8v+SqxQ8c1FWUtQTBc807IpTRfcbhWM4Rd6XEOWzJ5tt
         wCfvymfv9AT9qc9gLW3+xbJsjLNJLrgKWkIzpGZ+xgHSJ+kYmp3T/XAUed62/tWXJTFC
         u42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720794627; x=1721399427;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alcBCeBHwiXj0n+hXF8W7ZUTjf6ut9oBuOsr8yu14vw=;
        b=InRz2e5tOfu6jaQM1Vl+BvnAAIEUJd4Eq7L8pO0WPLvdTaJPTHynT2ZXArcp7Kv3jV
         YQrOOosGhcxsARdBNE8qq+pVse9OnUq1lFHEZF+x3Fb3mZWXjzjyVW7pEa4mzTLBb+0G
         tWGmHuY918BDVyv7Eth+FxZnXYXtDulVngjTSgNGvteEfm64TDjw+qD0rZ7EX4L+sq05
         bO5kybIaI+gF/6Jn6+gZH5IVl76WtbS/ZrKiwGIhIzriYot+6OTk9Soy8UbDWOV+1TGO
         ReULvMQbJgyKEye21lsbYm48W467k5VZf2OuNWagU0KPQeCTy0xwI50WeVjUbuE8qYA/
         Ig7A==
X-Forwarded-Encrypted: i=1; AJvYcCUf7zEVhhm6jzuUodA1c35pgjHfLh7WOxEce3/m2YjEShPNLPy9LNSUh2Mx+yJ1WdFMoUi7YzG3IFo7TmUfl2W7Kd31
X-Gm-Message-State: AOJu0YxWsXbgrnFUCXgmR7UjqSfH+2V/Y7DZnFnlKmJQ3igxAx/bDocx
	oV+slnsB22/3kTcrQ6RWCVvnJcsUoyNK+T3R/zTiqOf1rKJTIMvdG0sNtYyuKLzot1te6yNyG/a
	dl88g1F+tiOTktoMVndoWn/ijWYA=
X-Google-Smtp-Source: AGHT+IG8gtYHcWhYIa/raxAMEUfMDAXaH2ixSD7lXeKGzT1uyDGpJqXE7og93Moj5HtYaifBaQHPa90q88CmIKnndh0=
X-Received: by 2002:a2e:9859:0:b0:2ec:4a95:5f05 with SMTP id
 38308e7fff4ca-2eec98bbdfcmr29501431fa.3.1720794626549; Fri, 12 Jul 2024
 07:30:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240712141844.3274214-1-Frank.Li@nxp.com>
In-Reply-To: <20240712141844.3274214-1-Frank.Li@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 12 Jul 2024 11:30:14 -0300
Message-ID: <CAOMZO5DyP_V7+hSGm6q2ReTUhQ6ebTaLrx=qNhkuFSpCHc+8NA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] watchdog: imx7ulp_wdt: move post_rcs_wait into
 struct imx_wdt_hw_feature
To: Frank Li <Frank.Li@nxp.com>
Cc: linux@roeck-us.net, alice.guo@nxp.com, imx@lists.linux.dev, 
	kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	s.hauer@pengutronix.de, shawnguo@kernel.org, wim@linux-watchdog.org, 
	ye.li@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 11:19=E2=80=AFAM Frank Li <Frank.Li@nxp.com> wrote:
>
> Move post_rcs_wait into struct imx_wdt_hw_feature to simple code logic fo=
r
> difference compatible string.
>
> i.MX93 watchdog needn't wait 2.5 clocks after RCS is done. So needn't set

s/needn't/does not need

You mention i.MX93 here, but the code touches i.MX8ULP. Is that correct?
