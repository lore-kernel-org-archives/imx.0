Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D68139B972
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 05:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549618; cv=pass; b=buDIvmXYqZYl21GtbAoQVl4zpm/QTPEXKqw6taRzEtZgWzkUpgqErJvwxMxJ7sRDWcLVUp8HmjUQfj3sXe5VjQBGZ37Leqj8T/49+lcp/zU2xqKHPBtmL60/TfLl4ImQe82x/JedAAVul70a4AR2/ZrU/Sl09+xbnG3SZPuHX84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549618; c=relaxed/simple;
	bh=u2pW4wmygR3dXwagq0XV8Bt5dlVjxbvb0kFPeZrpFfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2gv4no7KygtCP2V+Xf4yddWlAAWt4XyhwpMv2oNnwwyZor80MPI1burnp2OLNznXrLxkeievontEUcG56AG0sqBTrp7cTjbq86YAKjtfO70sqzUwMV6H2XAaDrKKP7dGmSl96EdyZJapaMl7GC8mqyERuszFGKmjr4M7xIeFQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6uer1vT; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6uer1vT"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6b5aa7535so4415555ad.2
        for <imx@lists.linux.dev>; Sun, 23 Aug 2026 22:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787549598; cv=none;
        d=google.com; s=arc-20260327;
        b=hwnfFp4qWlbRUD1eti5C27/BDOkS9wrYrqYLpJVP8vXKk+dQltPE1ZGCdeUOMANa0a
         oKqSTZn695haKeuqjFgkolV3G60dQX2W4+bf3XUmaO/BOAFsx7TlpiDH5vEiKyWaqnAZ
         J3e6d34G4WQ9+ANMJvYdalylYHbLN2/du/rs2XIzp2LJRjyOykNJuC1vfOKX2JyhocpE
         1ZBfmgHyToZfmut27UWnHJfHSMgoBhLQYk1EgPBmGwHVo9Tnx+/P+A1va7k/U8c9LdrJ
         8x9M8nDD+ZdHErJw2+EKzzLlIUFmRBDUupCKAYI0lQkC9UdevGRF9CDLTdpc/H0n8BsN
         ITKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZgWPo/d4mM1nv1nI4JvnZPf2X/ppKpeP+qcWytdgVM0=;
        fh=xWN6Sxm5THaeIAc2Vv0GdCDsmK4GlmxnLmWdgGYwcDQ=;
        b=Jo1Ijo4IYHHlCkD6RuEX67ag7WuTATWRv9YT7lYtVajvUvnAcJaT+kGgIWLM3u7MFy
         ygtKEcWbketbBtebtt+MyoTrQbQWbwBzAMTTGpjSzlCcokbClXqBD/T/GCeDgebsxVk5
         HLKKfEFXi7EbkWSA8WMSC0kqm9S6jnOoQJMj2zlbM8jbts1wKphBUbB20AODe63QXveA
         aDA+fRrTEuPwdSGDAqWTmKntVqU+yx7DTwA1H2rzyi8UY9P3NhcEZbWMGGILh/6dB1x7
         2J4L+q/OIZ6q7lMQBDYuWWLdfVFTGdO4DmCWBA0T3gF9t5WqONUAMPoruPSNgfjRi0zj
         O6SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787549598; x=1788154398; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZgWPo/d4mM1nv1nI4JvnZPf2X/ppKpeP+qcWytdgVM0=;
        b=T6uer1vTE00TF/zsplFoZ5wjiHmMpbek4mjZZ7/LzKX/UxrEQ2MavfZ8/qAhR2Q9P/
         yb6s4BpjjumeYFdYEGwhPAJUlbffLjgzqTG+ANQIpO1ojU2DFacXQ+Jx2f8/URZWZllZ
         8DpQQewQEiF1XVIjdxzsxS9ZbJKg5a5eFrPYjhT9Kpfnm2V6mzCtS4/VQkqgZgCWL874
         ZwMn85WPvsdWnQpcd3V5/c4yNIHQ9i5HW5lwsYtRrfRyGAsRSINSK+ac7RQb9aUBG40g
         6YY16f+WfCIIrgQ4fja8qf0Pn09wVFbxb8V70zrWi88YPcEbuOz/FTvJKN8e+AXD7VK9
         Xs6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549598; x=1788154398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZgWPo/d4mM1nv1nI4JvnZPf2X/ppKpeP+qcWytdgVM0=;
        b=fJQcLu5cdbxse7/0o1CCOwQnrw9xVZW2n4B5oaFwPMZBKWMmzf80xNmIDlWXynBC2V
         0MTwSkI4LxE+bfpjp0PibgRwg5ZBjKG7NoGLICvn/AGY9+0qNzwO6Vt59EE43bcZ5l2W
         Wolp2vevOTWJrtwOuWfpzWzETqubgZEOmCiSwz0E7wrP9B59F2XNLO42Y3Q0HEpU1MOw
         ta92F05cJ6TYkMN1wnaoD8guOLiJymHPFBfcPUAvhkmja/lJ94yIY3qUvXyNMncyh9g2
         Zj1MLWE8H6j0aFhNBebyY2+rQdDQegMb8Re6zWv8uqN/jbkoBelYV3DaI/uxO7tJZCD3
         ZzkA==
X-Forwarded-Encrypted: i=1; AHgh+RqE5J2jPiH757lEOk9GDqU88+Zi9Nx1FicjvZXY8ZllXj1nEUYw0/iONPfCcqupCU0tLuk=@lists.linux.dev
X-Gm-Message-State: AFuF++l7Uxgo+dqYBKCGcAA/M0WAWT5LegSKh7D7YIUB+cvnIX4uaB9W
	LnEJiy7x4TjFnIVpziSCmMxO1WRNidfl09qIR4wt2Hn0/B552mBV6fdOoeB0AmoaPKcIg9TGkud
	tHDOzN/n1N7F+/8CnQIWZPbOvGDHU2thr5vhi
X-Gm-Gg: AR+sD10X+YVYDxiOB0K5WkuH0QF96o7TLHhH2dgOf1KuOEqbjfEA7zKnJR6FDRr4KN0
	7bBJs72Jq67VD0Pb0wlzapqcbITiSkQcQ12i/uKZMYEslD50pVJxXqKVeSe4RsXFbdUPMD+iJfs
	FTYlog/dDnHadZxGlhUiSdWfPEebReclSI1stqEm0md0fSEGxQAne58baeu/7JTdePWW61/XE6u
	cHhkYjn+e1wTY7MtmkMErLTsCjBnWkjSNcGH9+WnpnXRUuhskfDMEZg3KbUKnqVWXcxHjPV12Wv
	0JvLcpJFEQGlLVI+mgklj9LmFr4yloYHOcPfiJ2yrDXd0Q1ssxf3Jl+eMTEFeacDD4WXf98/9PG
	bufsNrpK++rOsiuuZEsvvn/swE2DshelAcI9L62YSw0cODohJgnUychkn
X-Received: by 2002:a17:903:2c04:b0:2c9:e9db:8167 with SMTP id
 d9443c01a7336-2d64ae365bcmr463958495ad.7.1787549598357; Sun, 23 Aug 2026
 22:33:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820111416.97917-1-phucduc.bui@gmail.com> <GV2PR04MB1173976A5DA80B2816493C84788A32@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nFeaLMzk=2_HGvCktZwU7DmNWsHV-vHSBGwbWU8k-TLfg@mail.gmail.com> <GV2PR04MB11739998877A19F8B8A66587788A02@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB11739998877A19F8B8A66587788A02@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 24 Aug 2026 12:33:06 +0700
X-Gm-Features: AcwNN1WY8iIXJWzCjnoHwJI_F0gxDEnF1n15W42yUutj6_q6MNOAJgV3r2kC6lk
Message-ID: <CAABR9nE-THE0eDv9Shkb8ukL+4Tzh7XAwRndc6iM5Y6DPq2pJA@mail.gmail.com>
Subject: Re: [PATCH 1/2] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Wei Fang,

Thank you for your feedback.


>
> You should add a separate patch to fix the pre-existing issue, and the
> patch targets to net tree. Patches to net tree are welcome at any time.
> And you need to add the target tree in the subject so that netdev
> maintainers know which git tree the patch should be applied to. For
> example:
>     [PATCH net]        -> net tree
>     [PATCH net-next]    -> net-next tree
>

Thanks for the clarification.
I will split this into two separate patches: one for the main issue
addressed by
the current series, which I will send to net-next after August 31, and another
patch to fix the pre-existing issue, with a Fixes tag, which I will
send to net soon.

Best regards,
Phuc
