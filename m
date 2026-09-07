Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDEB483BD5
	for <imx@lists.linux.dev>; Mon,  7 Sep 2026 12:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782769; cv=pass; b=uROMwSE4jVua9OGLCbj1Lv9bJvCIuceAs9mGv9equ4qdU2XPcozzmdHp4qiElE9HMg0+ivbTiDChwV9wwYnETGdcK+2pmGe0DsOvVVjwihrEBLICtG1+AvBSFswAfMsJHJd1FqKlI0T+2qRcFJTWWigeh/QcMIP3JUshL6uNuMw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782769; c=relaxed/simple;
	bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CZXLUjVvBy1ILzSZbFEVRrvVRf363elqQWEe+me1GIlpxMiTvK7+xIMZp3h0qjnhpgHfE51npQMzYpqLspQBf/TYL1DZMxo8WqPgjmXEAAxY6+LNxs0WsmzM4ZGt9E68z67wFmiWppC9lfBdpuQpRfmUatOnt9GkbidDiDuvO38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJnkv/wj; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJnkv/wj"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8541875f596so1240558b3a.0
        for <imx@lists.linux.dev>; Mon, 07 Sep 2026 05:06:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788782767; cv=none;
        d=google.com; s=arc-20260327;
        b=PTDp4PdUopx7uHvk7ydPkdwJu9kj8WzaXj7UOntxrq0kkS9tdPkcwQc45gU3jm0SPf
         /uXpC5s4BGcflQz2hFpANWUVKrXm1ralOZa8CnsVG4N3oF8/hugWlKTo0iSXqSkGXNAE
         7jnOx010zsOScgWGXVzA/+ZZzQlnQ3CuUdT40ZzsCpFZ+aiNYjOuYZuuebYKU6hLLNVZ
         K1gWmDXV6FFBfg+pWdWB3lMOTidCMtZrmD5FwHtmXESVOCh9hjYt3U4D36G0YVEM0Tgf
         iWJMG4Y0xoaXf7xzsnNjIyO1h0+89zZ9QGtVDfppgRwYcjHZZSNcG8pdxrSim5WPqGZ/
         wkRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        fh=Z2DgvXc0Fsq+BD2VgZQScIOBk7JA0I8ehaKe5+Z3VXI=;
        b=EH8bsadY6ytMoSspISkUSqe+DnVbgS0kMkhXW+5e6M8ealVoFia7p781RicgRYvdn1
         mvnRnUpgVklDTDS1tq15gDVtjHP6LTw6Z0II0HDo0fCAutcAYTByAdJaYHxzTlvkeJ4t
         cWTDhvdgYs2833rP0aQN/JYtmYVc0gFsNtD1tLPGWrfaRyE4x2lYTeVL4gs4hn+cFvw7
         kaCZJKf1pTQjdln9sgwsAYfPWnBeu3Lj/QeUU6VbNUJQqXGOu2tGW7o0y5rAqTBPR0i1
         I+1UymE2Eh8Ew2Fe9Isxm8qhIcv14sPtD488JR0kUTkjl2Ybt9typowBYudDTvhlIFXV
         r+9Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788782767; x=1789387567; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        b=qJnkv/wjetZFhtfX2ndcHnHSlBBN8SAG+/x/SM1iYyd6a39gz2jBuPLZv40i9bWuwb
         SeBHgrxe2Dvpd3R5Nyxk7JFbw5XE9LK87nbOmbg0LxZAs6WPK6O6Pq5s3dSW73B2PE9C
         47wk0GGymWrUFqm/ocafkMjeqfpU4LojAeE9AEdhQT2WhPmYVdFcDwWfv5JSI7ScP71X
         Vooc36zqNlY7xni578LdXxUATUPzrCjq5Ze7xAAOjy9N+TNzyQ7icvO4NqhJYeK5kkdA
         ryI7CnmoNYhG/Kt2kwySOvUBRXVhbsj5gLV3dsbU5ZDWZ15XIsc2o41DcOKL3kyLFLm7
         8uvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782767; x=1789387567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HhprkWnzm5aZiGMD+GyLSsyNyk0pGLWTcDgmWY/eXjY=;
        b=HwbrTbLAZvpnireYlwuHpoNl13Xltrqvro6NH9EyM1jOo0GwxPFpCSVZR7GsdZIBqo
         MFT3V/sjB74EELeUe54HIefLo281jE+t829DopkwN2OMXm8TG/gun8s48YoZCehGEmGI
         bQgOQz2uC4SjoIJ63ft+8csl+SX6u0vngEYw/y/uu9saSdST6BX12DxurBOQYeWcwk9r
         vRVWDwjBxaLr80NYdX3xkB7kEQlAuY2Krg0XskfK1ZDW/T4JqeYoMy1Bn/HeKH5rYA+m
         xIKQQ4clwC0U22TkAjsDWY7Y1/j2FTeDlkIe/5nLXwL3SdSQSpqe2SqzSfVZSbzOiq1g
         ZalQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzCLHZWXBP/b20gufSX5cgGDhj6mwXmTewH9XQAqC/GsxI47Mq8HUElCqi5ud0hqQItRw=@lists.linux.dev
X-Gm-Message-State: AFuF++m0kys31FpPgzvZYVuuvhGJSDEbpZfNSuu83DGNQgEgMD+f8KwA
	T+lXIAeZ2nFZo3V0yZqhMLYGQ6/YCXrtf2pIknzWcq9fW6GSNV/cH8VyNkPpnQ52Y0acZikkeK/
	jFot+3KMYQXarOAuwrEQpGC/fAJynemQ=
X-Gm-Gg: AYBFou12lEmL5QDp/06A8gQiPOOsFXgae+YJuLETRAyEccaufohtqbO3ssF+VjW58gV
	kbY5l3ihuECgLAb/ruiRWKJ2WxO+yXhnm/Sj2+Wztcu6nhCp+/FL1ufV4ajiPDtLX2dBd+yG18+
	BO+yp5Ef8vOuYwZOE0eNIhnlPQLS2c15duRIDIRqDuyz3Pmt/D2+4H0EIaxGOLZvdlVyywrr00m
	NCjjULb0ZKcGC2ypuMC04LFdHz61RsNCx1Sh9hmnY2Br22Rf9NzrHdx9miP7zpveT8eX6pRV9Ou
	ySyXvsqsxb+mgsVzEEq4chWZBgKrrU7UCeX/lskS6lQyXnTddZzX2F8GTsjbB+HmYiDg8ZvQw0T
	3Xo2EZ8iHDfFiOcJqOO+Q5vUWVvQ4wqzW7dzmDWyZOfMHt0rRQ1yKwR5d
X-Received: by 2002:a05:6a00:4c15:b0:848:46a0:3d74 with SMTP id
 d2e1a72fcca58-86169b6b588mr27969662b3a.9.1788782766620; Mon, 07 Sep 2026
 05:06:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260907034502.12619-1-phucduc.bui@gmail.com> <GV2PR04MB11739E45D1562C9063E05D77788B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB11739E45D1562C9063E05D77788B22@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 7 Sep 2026 19:05:52 +0700
X-Gm-Features: AcwNN1VgFt55b8C2DAXKx-uTJk3d_l7pJsW4Kx0oozTChu1fJXNM2fyLx2t5bvA
Message-ID: <CAABR9nEHY+A3y52GmozKTQnot1RcCRZVV-Js5eyt7CQsb3JZjw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: fec: Propagate PTP initialization errors
To: Wei Fang <wei.fang@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, 
	"davem@davemloft.net" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Stephen Boyd <swboyd@chromium.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wei,

Thanks for the review.

> This part is unrelated to PTP and inconsistent with the subject, it shoul=
d be
> added to a separate patch.
>

I=E2=80=99ll split this out into a separate patch and send it shortly.

Best regards,
Phuc
