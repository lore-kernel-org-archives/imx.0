Received: from out.smtpout.orange.fr (out-17.smtpout.orange.fr [193.252.22.17])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F3D1D8DE0
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741245363; cv=none; b=lJhOSoZxuoFain8c15k/M1zlO4rSGVryQ4GMsdSAwbXBfwU6wjn28uXT97URHaNdI+hx2qwpQMFbthvKVN6bCQu+K5adpouw760xpNcvQuieL8ywpOnBvzalwr5vWYQAWBDcmV9e36q+/twPvGjamdm4EPlF6hmZtu/8ZvOYQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741245363; c=relaxed/simple;
	bh=0418C/W8KiV5zE5TlgyDvTR1gSi2KXM/MYdvecfDGyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MvUKDZDHd69Fen1vbjiqLki0oiU9lcIWNF+m+OzHNmJKqOto8hEbgOf62CXuobstUrX3r4Z1rwL4FoZzHeXietCaBY4qlchcqpItUKznQp4fd6e5nF6tFqEEV5RSvN+t7YWLRRVNiCBOAOAYfnqeZSv0EVKN1meL1YbNzDvnHmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=CRkTN6z8; arc=none smtp.client-ip=193.252.22.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="CRkTN6z8"
Received: from mail-ed1-f41.google.com ([209.85.208.41])
	by smtp.orange.fr with ESMTPSA
	id q5SQtTiEdOOosq5STtHq4I; Thu, 06 Mar 2025 08:15:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741245354;
	bh=0418C/W8KiV5zE5TlgyDvTR1gSi2KXM/MYdvecfDGyc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=CRkTN6z8F3rMDESrtWSAFcCWRB1a/gyrCgFQbk8+MqAUIAzcAAsqvpcuuFrbPRI/W
	 dGmTvcHbYUrMJN8DYkB7z6xCPH5gr5R7J/G4Rb56L/FQH/Zd0RTB2D2loyjJxMTTBd
	 ogsKb575pOCypsGwiYD2po1JFv0p+yDug3pfgyTuiI8VSSvHp71zvqFReCs+MPp0qi
	 RJo6xSY15q0jdCCtNoqM2hXtoyFFn+Dp3FwviBbbtPfud8435kwaJGxtdFDmJQnzNN
	 X5vSnqzAgZHXhDvzc141H2hm2q9D3Cgeq6SjBJygrnekpxDuEPemEWL6LX8+APgHFD
	 UpfmkllaJ+BcA==
X-ME-Helo: mail-ed1-f41.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 08:15:54 +0100
X-ME-IP: 209.85.208.41
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e57c81d5d0so392738a12.2
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 23:15:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwdQouy/0Fkl3Ee0VlHIqh8R7wPl7Dus8Kqp1B4pYvJDWiXK2bbPkOWBp1mZALtscVgTo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwD7JYqRVMksr0gLgWzCYWGMVY+T7av7BrDkZuoCsn2t7YwJlnW
	NsFox50/+YRKaeOhuMtwtq6vOHWw0C/nWF/xdi6/iWmgg0y7LqSOyXKM+SwX3glz91oeNrw8VfJ
	AHuacazjoAhe2HSFwniyrxm/ixIg=
X-Google-Smtp-Source: AGHT+IFm3MQS5dgUYs1J7ifAfjVQ57iJeI+pjUmHRcmb45bQF4uoMwgIZEif/LCb+H/9N+qRcChkDTYQ1VADoEncMp4=
X-Received: by 2002:a05:6402:13cd:b0:5dc:74fd:abf1 with SMTP id
 4fb4d7f45d1cf-5e59f3ee29amr14210055a12.15.1741245347074; Wed, 05 Mar 2025
 23:15:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306065921.2329517-1-haibo.chen@nxp.com> <20250306065921.2329517-2-haibo.chen@nxp.com>
In-Reply-To: <20250306065921.2329517-2-haibo.chen@nxp.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Thu, 6 Mar 2025 16:15:35 +0900
X-Gmail-Original-Message-ID: <CAMZ6RqLZNeTsmXkdxyUtiu016xuqbPeG1jyiE1WMPVNrhS=dAw@mail.gmail.com>
X-Gm-Features: AQ5f1JrdIDM0fL-S0vORrvulswXM_f2Ms6biMDjYK9kiDkIB2GoOPzf_rtumh5Y
Message-ID: <CAMZ6RqLZNeTsmXkdxyUtiu016xuqbPeG1jyiE1WMPVNrhS=dAw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] can: flexcan: disable transceiver during system PM
To: haibo.chen@nxp.com
Cc: mkl@pengutronix.de, ciprianmarian.costea@oss.nxp.com, han.xu@nxp.com, 
	u.kleine-koenig@baylibre.com, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu. 6 Mar 2025 at 15:58, <haibo.chen@nxp.com> wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> During system PM, if no wakeup requirement, disable transceiver to
> save power.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>

For this series, I guess you want to add stable@vger.kernel.org in CC.
Power saving seems worth a backport to me :)
Marc, maybe you can take care of this when applying?

Yours sincerely,
Vincent Mailhol
