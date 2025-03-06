Received: from out.smtpout.orange.fr (out-68.smtpout.orange.fr [193.252.22.68])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2531C8638
	for <imx@lists.linux.dev>; Thu,  6 Mar 2025 07:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741245328; cv=none; b=kkiUNa55j+Cyfb+lL3lCcIERsfKTPHb2U960G+mIEbOKqMfwIpyjyo0du1I1rf7rd4ELS62+LTpkEOySsJpQSMJ15Gdol4aK9Mub+RH/qVZTmf/7mobLSSgfw25RqvM7ZbqBLfQZ+UYtkr7x7+2yurn6rzHtZowK+pKVPzySf/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741245328; c=relaxed/simple;
	bh=7IUWR6VRphGA3aYG0HEflrporgT5Cn484F0bHIkP0Cw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BU/FOJjOR1kkFV3ZyYYsSUXKK0h600IupUkvcmZ7hHWHqoySQxquZPi0K2CyGjbwTBs5OVh8GwDD5x1rdbHZBFNoNidZ66dxp5VBmgqJyDxkeYNPw74uD0vwNRUr+lS3LnoPzd0csTQVNvEg2FKbL1DO89U1WnezGHYEwveCphs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=f3SzWnFk; arc=none smtp.client-ip=193.252.22.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="f3SzWnFk"
Received: from mail-ed1-f42.google.com ([209.85.208.42])
	by smtp.orange.fr with ESMTPSA
	id q5RrtHgGon53Vq5RutjmYV; Thu, 06 Mar 2025 08:15:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1741245318;
	bh=7IUWR6VRphGA3aYG0HEflrporgT5Cn484F0bHIkP0Cw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=f3SzWnFkBHBNsSUVUak8ipH/vV54a6yvsobqC5kUVQU2mhMQIunOM255/nxBlDg4w
	 vs/unQ9pk2y3gOQPhayvwDcvuMN8y/h1DksXa2YbthX9888tAt9Neoo/Zw+zq5TfRR
	 dwGCrPb0bCDryWRzUl+j/JsGmTuRV3eCXeEUcKMB6k0HAYgSOvPaU4bj0f7wgiT3cs
	 xcMjxkM/RSAUuRbRv3PDUr+FSELcC2HGzaO4L2jDThQOXqaBWOr9HYVcOBds1ddWVi
	 +TVeJWKf7MrXCYqkq+NEjN3rQ/PgORB7IfACrAdmEAvFJYr5M75xCvsDkM7pBFeleW
	 1vxiBQWo8ByiA==
X-ME-Helo: mail-ed1-f42.google.com
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Thu, 06 Mar 2025 08:15:18 +0100
X-ME-IP: 209.85.208.42
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so531591a12.0
        for <imx@lists.linux.dev>; Wed, 05 Mar 2025 23:15:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQZUb7uT1pcJCERKM5nNkM9xOp11+e2LDMcP02p52ygbjLJPZ/hsB379nb4MGIIzYCWLY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQ2g7MBfAs6c1oYfXuDTHm5EkHoyjhYxn+qwSytkEev/oW2o/E
	qOCoFEWLBNWXEF0C0Twx7nwuuwNA1qi0a3gT1CQS5dKBHs9Tc7PF5TxunGjN+xuleljU3Qk/sxd
	ludgrRFGKVVYBcxhqurbES3bmOKA=
X-Google-Smtp-Source: AGHT+IH8hhh6oAYyC6uPKA9rsfgpkWm6NvzIO7DuDV3vZ2zHoYRgLCoR764aoz0s0rZpSzABXV4x3MLsFt2ljnQKjUc=
X-Received: by 2002:a17:907:c302:b0:abe:c894:5986 with SMTP id
 a640c23a62f3a-ac20dae1ff1mr707065166b.39.1741245315138; Wed, 05 Mar 2025
 23:15:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306065921.2329517-1-haibo.chen@nxp.com>
In-Reply-To: <20250306065921.2329517-1-haibo.chen@nxp.com>
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Date: Thu, 6 Mar 2025 16:15:03 +0900
X-Gmail-Original-Message-ID: <CAMZ6Rq+XNSCKLucZkiMReh+8M4Enh2s0ugHzdkJeGT1=d+GkLw@mail.gmail.com>
X-Gm-Features: AQ5f1JpY8DmpHY3mF04-zFYQMw4LTMTeBGxWIrKJrVySNOR79ap0KMlA_eWB2ik
Message-ID: <CAMZ6Rq+XNSCKLucZkiMReh+8M4Enh2s0ugHzdkJeGT1=d+GkLw@mail.gmail.com>
Subject: Re: [PATCH 1/2] can: flexcan: only set CAN_STATE_ERROR_ACTIVE when
 resume has no issue
To: haibo.chen@nxp.com
Cc: mkl@pengutronix.de, ciprianmarian.costea@oss.nxp.com, han.xu@nxp.com, 
	u.kleine-koenig@baylibre.com, linux-can@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu. 6 Mar 2025 at 15:58, <haibo.chen@nxp.com> wrote:
> From: Haibo Chen <haibo.chen@nxp.com>
>
> Only set CAN state to CAN_STATE_ERROR_ACTIVE when resume process has
> no issue, otherwise keep in CAN_STATE_SLEEPING as suspend did.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
