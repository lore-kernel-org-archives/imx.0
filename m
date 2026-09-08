Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E5314D35
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 01:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788831605; cv=pass; b=B6DBlOy8tQsKlN4dv97/CfH3U+jIhU6GwKAfO9ms+VDX+ppNKl7BMVHRs8pvX1iAGJYkBMCg+ZTkfB3geAWfUzv3Jn6w/fSkuQUpgMmvqGZIg59BUoTCfXXVn1sU3y73qypJH0025tDh0DAxCt+JId7Lm0Kgq0SDuqX6/ZhZQk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788831605; c=relaxed/simple;
	bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpy+mcy1VT4vSxsgBUj5QD1RXeElMlPUpBjBX+EfJVtcDrTK+WJIJTjYjkNji9mxCYcuXYSSTf4gLyzGhyj1vNpS93CK9jr79ZEucagx/0nHSQI4W1bIq2f1R+FC4XzMVgNfDCanvGIMGsFYGfdg1UR8A91h9vENWG6AocsZFOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbeQTgbD; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbeQTgbD"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso3644993a12.0
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 18:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788831603; cv=none;
        d=google.com; s=arc-20260327;
        b=LFmpIUOmZASh2HSbnhG9r0mV543dcxkpOQI5dftPFU5o/fZUy2Is+cDc+KjjGC9sIH
         8Q1mayIRT8CIZRZI8B2Ni9V3fvR0KnU3yS/fZ/nfwpQxypJdLyTcwg3H3IXkwLOXYfvp
         vDv/LU37k1+EWxfZcMV9BcR/wDufjHgI4SnT9IMubDD2UTLXt0KInCJmjPyPgpN9O7ZN
         0P3xqQI4WRl4xyzKBBGk84sLOz2ORa34bEShqxDIuUEPG92xpJmjNtYDS2RbxCS0BLC2
         EDLhrdKRsoZ/WNAc9hmWdRbw0qnaBgFQb+q7f2k6I0/vi2GPH8SXB20RmwEK7M9gyfVl
         QSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        fh=gm4BlBDHBfsG4qHyoQdMLRaYUUf+LG2TfmWy9L62mA8=;
        b=TNhRrIG3NREGWALiuPaSh9SRC2HfphB+V+GSRqm1oFR0AXCh/2cTAh3FmflmQKjX/I
         9w9BRuzKjSQxayN/zoGKY+67P7dFaRgz2WC636nF83cni2ipryJbZzCo7q+x8DRPAOdt
         M0LmGeEQrur/E+914iwtF5AhvFFNLW/ylwtkvDkwfSlDjVqBsimXil2OKZmhV6VVhP2j
         EiWEzgxSM++SV1ySXpCsGzsyJ7Vl9Z9E0Qy+tW3r4BwJ4RshyfZmYOASjdZeQQ69PrA1
         gN+cDH54RVCO8pgj5NH7vklLJ4j0SX5BzRvyg8JS85TWx6cDDI8n1k1U43sl/xaTX4NR
         Yhqw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788831603; x=1789436403; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        b=dbeQTgbDpLjKN6ZHhcaDwE+KIyhJl+RSUVXhSokfpP9YQ+xSMtrgtIxAhyMa2Q5q5w
         XI/9CGKYt+26Dfy+R7zW5WCADltZq+Q2vMZKox+kKSOa0xaKVatBQaYMsPsxd0Xp4+Sf
         VdUoVShXT0dvCDFCCBQsEHdz7ZfkPeMcVEaR/IrBesTJiIHSLSoAfDqSRv7NCAzB9BPy
         /hxhHL3QlGNQ7s5ebiKuLvTNjGEnZxx6APMSSw3B9QkJoeLVqlHqIlMS29nXHlVSrkEO
         G59FzYJRpVOsYS4Xt3fLGUJpOF0OpqA9k3AYbWiUefLT5gUmNyT/i8t9V4cW+c58D3xh
         bANQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788831603; x=1789436403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5zuDYty8Bmr1QCZL1/0J0BM+bw13EUZbfwMloSDt9H8=;
        b=diirgXUy0JtL4XNEXxGVvlCHoKwWZUPFS4f/27eLngVAMV9rDfZOSTWYUj2WzW29Qx
         bATIhfX4mvN2lE1y+rxhGHPgF5V1PHqDoIKBMZxYeQXWk2gOVI87KLN9lqu+JBasGEU9
         UFyG25ZDKU/eHwWfaPo4AAeRNHE/lx3ALMAohaeBFK8nyz96nGcfGd/+Y1WnupYphVgG
         NxR2XRVvjMc2JTDGwX3X0WlVhsWqx2hXAtdGgqx++RT6spF5DohlMQXuhZdjdRoOcWv7
         IpZT15q/pPPhkUJe70+zch86kKu9qhOIPcJ7IVhXgbnwTJOX/pExbBh5sAI3kmIfJOd3
         MFiQ==
X-Forwarded-Encrypted: i=1; AKwUvByobFZvgIL7nKwzCxjJKCH2ytPwZfSLCbkDl3eJHqwuu37iqoHQORRv8EeMIawHWofB9zw=@lists.linux.dev
X-Gm-Message-State: AFuF++kq0aqM2MWD7NDSjZ6I+Tlt4alTcrc5NOieIUFu2TDu1g3hQ+ms
	1LgBNdFTFz9A7i+/OQTX/V8Xw4VYVXlbXeahGIh3ovoDMFHj+2HLhIGAocLdrlLNPOYrrQF7I33
	psBXTJ7j37rW1D5u/aFOmTRZWtepjKJw=
X-Gm-Gg: AYBFou3aGSfjjcUMIATCjw7tU8Ht22HRLXSlkt9U2dN5CTN6vEaxOEy3dZ/6dCyOHJe
	4A1mhvlvjPBsPJBNlOrx4b0NFEDuSlj1ckTPOjk6Ou8ICx4o5HF2Fx5Iktlo/9SIvCDz1uQkgKd
	06NOoZWRmWCMeM7IOBYJCg22LJv5k4wIhjfyaFKwjWbx+DJRin9SdK4vKys/aJgXXc6/o5FQjif
	DcixJ7w9J0k4tCcWmIoiSEZhouxuU6Di9z5eZfCIO6ZmU5UZWbG+cszd0uc0xbd6v2v5uEG7Mul
	1aeeEW0TJ2a7lp0mrrOJqyO4cDxB7YR3SikrtDtK8PRkgOBGfbLuaAW4KBvP+S/OU5QQS9JQL99
	v3XnPfLLd/d52yrDd9kiPTPPDuGiGhJRjk23XFbTDjI8u/oHq47znz5mM
X-Received: by 2002:a17:90b:2d46:b0:38f:57f0:1f5d with SMTP id
 98e67ed59e1d1-39b2620a25emr36859083a91.15.1788831603448; Mon, 07 Sep 2026
 18:40:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
 <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com>
 <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
 <CAABR9nHUXPL8dV8iqJ-x4OWRLw-qRm8MTq_QDTEJ94WhLWRiqg@mail.gmail.com> <ap7fP5Lz04kySgn9@pve>
In-Reply-To: <ap7fP5Lz04kySgn9@pve>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 8 Sep 2026 08:39:52 +0700
X-Gm-Features: AcwNN1WskE-ZrizZC_ni21bq3lop72zxd2TyEp9MyLsJLSJ8j4zlvcW0r8mEdEY
Message-ID: <CAABR9nHLcR103aADF1WMSEkw-_BjWB9vyWXENJCYfjX5Wz1nkw@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Simon Horman <horms@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "swboyd@chromium.org" <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Shengzhuo Wei,

Thanks for reaching out.

>
> Are you planning a separate patch for the IRQ lifetime issue? I'd
> like to coordinate so that we cover these paths without duplicating
> the work.
>

I'm not working on a separate patch for this,
so please feel free to handle all of it in your v2.
Thanks for taking care of it.

Best regards,
Phuc
