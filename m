Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D4E2517A5
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 02:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788748123; cv=pass; b=JVeXFtFgKKBnThI6pHS8IBVSkAbEpB0D/iOQGlIux+2nQvrGA4m1lO+HYc8rQYkNMrIRRL1zhDYyVJtVxhf5CpWp7zkrz76HssGKJqSu8SMvACDlzySH5sqTDZ79jtzsyOu+tISa6pvG+dmYuepbOqizBzc2N87ReJplyLl25as=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788748123; c=relaxed/simple;
	bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m23MdqpKaorHiTwB2DvIcQBx+4ufkusfT4jntXK5AL6IopLtURJoC+82wJ6huBvH5GzR8Kj43NvpQdtdh2jiKl3H/gG5qO5znNhXqvfhqXLhI/RBcAMBW9BiKWytBYSRf/TEvCMDN5+PqFjPXhAEs6Z5vvwPpDttF/Pr+Mh839Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AoBHzfPF; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoBHzfPF"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d7195706f1so32387565ad.0
        for <imx@lists.linux.dev>; Sun, 06 Sep 2026 19:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788748122; cv=none;
        d=google.com; s=arc-20260327;
        b=E32PRvzoVkiESGm9KaY8ACThjAbAjLeIBb/HVPj9+XzoBUvQCFsXYZmuwOH7/Wh0Zw
         i9kDNDDoXpGjZQkHQ45kvTwXIpg7G0ReSa+mdiATtd3W7g48rlBF/sVNNZn9q67aWLHc
         mzZDl7fQFaRtD7z6vnAHcnzUSahkksgQtufgEsq4gFvNhnTF1nCDwVWkQO4nLc+Jj3dR
         Eq3YJOPR4xyl/d5mjdQOv7J25mlHJCkW9QEkYIlhgFGActleS0+MVygNYFbc4f337zUc
         tlCRrEaeKkI7p142HToIjmtn+SQyPBb7Uol8HBqjTtaN6PJpNDU3jCBjGsK8Js4azaZD
         M7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        fh=G4qvFJ9tNxmQRb6FmiBbZra98gvXJAt9nrdP5Q8O1C8=;
        b=ha/yShSef0JXNklViFhnwDSlC/AuzcdQrvUCKIY2RPMZvZKXsaNOLMmyDgvKdOG2Vw
         ykX2JiimWXQzXwtd3js3YRWeRrAjER6sXIhPMNeQD9UAfvzizPqdaS7H80KU92gCwlTS
         QrUUiOmQffEVKIJTRijSnnc939122w6kX+0nfq7rDNiYtLomWd2gbvUoPXptQviVFMky
         KGB45EAGUtOUAUoToesjNlZsvjjQp+35cDUNlPqn/PO47QvBBl3bivzivzIxLHjcAghE
         VTJ1mm3ZHUOO2lhvxINdXTNFOUnaU0x6uSSJqBXze9b0wTAEsHz4e0am6/U8oqRZDv+8
         HqPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788748122; x=1789352922; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        b=AoBHzfPFsspKl5rbwdp7w0cQnmqgzzFf5K2UEYEhoT7tZ900qQs07bsEbWeb+z6Y4L
         3rN1XddXEgF3EDyv6Z9/22+IS3LdaWNlXRyofEsy/X4pD+P12qxT+WzSRw0SvhQhhLlF
         Oe0W66X+0+YnLGoINKeBkMNPDnOSLhkQAS8CQBx/s5kr0t4o6/zaqDDOq8rHVjpYHmcY
         iECcVmVg3iz6k2zMcLtxpxfbWQfUR/fT0rUMdWxAvt0QgDP8zVC5dz+q38idY1gbLjqo
         2sHJZ22rEk+5abazQDjg1uxk9l2qp1fCcqPdFYPRfOHMoSBYEgIEQ2SCL3hwjeXBYkJG
         OvVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788748122; x=1789352922;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xaDigs+YPMftKzlU+luPuRXiinZXB7yVOimMjfEfb10=;
        b=H0d3arbKZXAFNyEzpYilIGX5VCfTS5LYfzbeYh23Nj1ewi0xVuiSF1j6LiSTz983V6
         UTMrxeEh1eTaf/8otstVBWvN62C6/ePeuT/LzeDpcqzYnUz0O6YZELcM4/squtMIvu4N
         /V5PMhO04nCuKM0WjqoMf9LIyv6PK7cQa49OqIbtru0xHw9mCcjIRFESdrZ+IRXzAaaG
         QMZuwQOUhqzorObTj2ZTJWnYuNKvCulpdR0pbPDRboxfUqSk10ucvp/1No/i569LBhHt
         mSYaLnbwuY8gIoWbL1+9Vc6bXeSyJd0LfFmdyt9jkwKlVyFAXMbkQJnCnzBvQw9DHMKV
         96aw==
X-Forwarded-Encrypted: i=1; AKwUvBxWcDKDhRBOu5B/2UJZOJinTDH9yMfXg55WG1K9fEe9D2/MxBOOM0ExYl382iGLZN0r1/Q=@lists.linux.dev
X-Gm-Message-State: AFuF++kMG/AebcxR/lbstG/c8+3nA9MHl3ifcQlbg6s9D4jNxzUXVthj
	XDNqUY9RNcCI58BO0W+ZECGO0OGaVlj2m0JdESpsyzmCvDs85xVZbD0gOqsJSkj6MzES0eKk8sI
	BP1eOY/i/0FPsioz0KEi+969CyKsSUv8=
X-Gm-Gg: AYBFou1OxQPnPqtTz+KsCCDIcmpMSNOVd5KlarZvBMH46oG3HzlhISz5GGlGEP/AzJm
	6PgoFEDm1FWud3hwx2HWuLAdJrRF2APnZRQFnJqDmN/LHhpgqEHTbR5rvu4G55Xfjg6KWIBBPT8
	FNpMrFdB2WXjVRzfW06J522QjjCccMTPUw2nF/bTwbuG+7gdD92uVLKY0qKcz4LZtoA5qSBCGBY
	xTeZi7qCNqjoeUZ1d+tMg+9PHTZekcsURI9IQbZJR5yTo5GVseh/3kzT8nIaSkGS1FO6p1Hx7uu
	bftuqS2K5INE6Fec8Ik70fUhCxPeoQYJ4Ex3VxF31v7etbuv6m7BUL10u2ZGHtwUGoKmufe0RZv
	FjD/JfxoqysjamIPJR9wxQVkcBxRWfUdOEEqdO3Ct7fEhtOqa1HhxDhRa
X-Received: by 2002:a17:903:2349:b0:2d0:cc92:f7a3 with SMTP id
 d9443c01a7336-2db125a5535mr296058245ad.2.1788748121672; Sun, 06 Sep 2026
 19:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260904105542.70540-1-phucduc.bui@gmail.com> <20260906131711.247708-1-horms@kernel.org>
 <CAABR9nFYrmteCtb6E_txg13U31Bf50p0PUBvaOXi3gmT7Z+0RQ@mail.gmail.com> <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB1173965A34420E072C0DD3A1988B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 09:28:30 +0700
X-Gm-Features: AcwNN1WcmIfrIxdZpRQHswHCpN6F3ZPaKgnosKc26H5L6i-cyqOgzdxXQl4mPdE
Message-ID: <CAABR9nHUXPL8dV8iqJ-x4OWRLw-qRm8MTq_QDTEJ94WhLWRiqg@mail.gmail.com>
Subject: Re: [PATCH net v3] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Simon Horman <horms@kernel.org>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, 
	"davem@davemloft.net" <davem@davemloft.net>, "edumazet@google.com" <edumazet@google.com>, 
	"kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com" <pabeni@redhat.com>, 
	"richardcochran@gmail.com" <richardcochran@gmail.com>, "swboyd@chromium.org" <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

> >
> > This is a pre-existing issue:
> >
> > Previously, I suggested using request_irq() and free_irq() manually,
> > but that would add more code.
> > Another option is to replace alloc_etherdev_mqs() with
> > devm_alloc_etherdev_mqs(). With the LIFO cleanup order,
> > devm_request_irq() will be cleaned up before free_netdev(res->ndev),
> > which should resolve the issue.
> >
> > Since this is a long-standing, pre-existing issue, I think it would be
> > better to handle it in a separate patch.
>
> This issue is currently being addressed in another thread:
> https://lore.kernel.org/imx/20260904-fec-ptp-pps-event-uaf-v1-2-9af446be4a11@cherr.cc/
>

Oh, great! I see it now.

However, it looks like that patch does not fully address the root cause.

There are two places where devm_request_irq() is called:
For PPS in fec_ptp_init().

In probe():
devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
0, pdev->name, ndev);

The approach in that patch only handles the first case, so it does not
fully solve the problem.
