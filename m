Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B215823BF9B
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 00:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770683952; cv=pass; b=bbbyCd4Q5ykdyJ/tfszNRWq2uazwL4d2+HoBK+T4bbqFBGTlmNHzvwFDFiI8z68brmwMVP/WKDRLy8E/HPea6/22++XLBlE42x5+w7kYgxnJQxv3p2WupWjLwTt8tiss7dcTJe704zdg+Jms2VkeAhWQG2jwyDZ1SRFUV/IywtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770683952; c=relaxed/simple;
	bh=CRHDCY+aNL8cCuJ5x1LKl4BcDxts38ZAFNhckqdTfRA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fg8SOYv9Q1TjOTUynb/3FYBagk+IzG8IrcJh4PeZamNg2FMnhYKjJvB0sO2Ia/+ErDT3I0DcOYJ/VEXA7zNxjSVqqu8w8xwNwBPZKqKk1bvjxumLElsJJuHPpzNit+ABipRP6VGZkA9KXIcSZkMgbBiOAkMii1RVKMcbZJbsk9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxg/2VJz; arc=pass smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxg/2VJz"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-67263e2ed52so425445eaf.2
        for <imx@lists.linux.dev>; Mon, 09 Feb 2026 16:39:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770683949; cv=none;
        d=google.com; s=arc-20240605;
        b=W1P24KY3hjTLJMompjYrvrSoKPZ0q1a1GFs8t1fLYNndrYSc1VlhcngyylA98aTLbT
         eh+h5eJXmRPhH0bE9Ev/gcgYsx98s8W1pz8IsuREVBtcuvg6FS73Jp6aM2SrPXC2QPTs
         W6pjdWkW8+W7h5sUY+TUuXEA3BQx0lvJsX3DeSA9VavslT+W5V9hQcOvAsWF+nYLSOOq
         RkS58phMeYp1QIKUryIeUqBO4b+PYWjAeiWaUOBFEpGHGiBcl5nO4cpeQBmb+289sp+/
         aQ18BirW8gL4KlaX+13pDQHcTS95H7D/niwnbGVmZwxiy/JuJAApnB3MMGpDr5WPMM9w
         1fGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        fh=cqq5mhXpCwidLIMASGkrNJ/Jxsx/ZEsk3qaZOv5tI14=;
        b=ZD/+lWhdZ/8eXCjZAtcyopmREb86TqvLDe4TbJ14B1h3yIGBmt7TlYhUHGmUE8j8NG
         QHqGF/wAE49EKKGfbv1HvK0mKtmSZJQRe4YVj8cEloiUBgCmTXLwcGVuXWe3UdoBBTbF
         0bAFDLCtSj8+YOWQYNzLGqn6rbxtfiLYdEOd6XVdaxSDp/LbjZmRulCSoq38CSYQ42Q3
         m0FUIqko+jDYA1xmQbkCMhrPSJKC8VbuHRX+54U8C1xR3rLNbNs5w+7LMxfOxr8074Ge
         e8+mPIXETpz3voqE9H1puAIej1GeU7Qh8fb/akc2v5ou6ii2udfd1XvEvLHIy/JFSKSe
         H2hQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770683949; x=1771288749; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=Nxg/2VJzl80lF2Stq9Uvvueoy1deUzqWdhrcMOMEJNatQi8KOtzNo74JGisjbjB6Wj
         v9lzgL7QA6UHRm8qN1rtM8O4Z/Xu1/0VHlSv/En4MKv9chab0p9VcVUnZwvFpa3HYVTu
         eSDxs9Jwsd5vU1vOi0Yc94jadEXyv5FJUC+7mpWKFFxU1nJ6jbYvBUU65Z1o583jlENN
         6/l24tx7dEvATYYOsBMJV3pjrJ4ZHtG9UirOoGurPzLAhqH5yHmQo7PfgPEzsukZmejh
         QnNIpLRuHCnCe2qxdqoAX84ZWm2UmxNAJO3/ZqLFxhTjRJLv8cvK4ZniBVgh+TltH0ry
         ifCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770683949; x=1771288749;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bf5IdcegF6twrrNNR7clze4xkdFwkIRE6sG++xaVg4U=;
        b=MWpYFyZwTe7YivjlFQcYGzQQSR9sdBLxH0JwK9Mi8HW33QT8i7v9JgfE8T5N/DcH9b
         9+X+GojG9kG3BMHDcTfKBviyLaS2hTiUj0nkEJr6POBFNVJc48KDTcYkjhaOeoo1L//p
         61pTa5h2PjDDJPp2GOl0pXsd9Rnyu4ReaSfcFxWqf20h/uCJMtVO8bccYkXH5KRVq55o
         9FByD4HSGERd9dFkDUwDMMC8btIsDUeneNrrnv9kJbhJ+Jdpv3M+DsAhUff/GQnQb4lI
         ii9ld/fU8jDRTQtGnUBQ3mYjgqJ2gaB0cMOuTbjWhFdKavkDcMUrwhuoZXfWoOO+Sr4A
         b2cw==
X-Forwarded-Encrypted: i=1; AJvYcCXzDtToLXpKlaZh1Yefmhr38gd/zpailQKGETnj6tbqIveek8oyYr0p5qfKsU7zteyghq0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2ArUkIkRQf4hPh6mthLI81KvHEFrrQnFIJflb5MACQYpJpX4f
	xg5xqlBFhamt+XkacI4Cz/o9jFX0fOLvyCGw68eEDugBEmJ99SP2P3hPr7x+R46dBjlDZGyusML
	gm881JYfB2xswU+XFvuY/gnk4oSTKEEM=
X-Gm-Gg: AZuq6aL+JEbz2XsZBSZqPCUSjssFjwFRnqSZK0UaUaUMd26jQ1BfItKesIPd+KEkAIu
	HpgtL02O+xzjuF4eGk0nWbTStDd73/phDAvL6Qa4hNLYKT/5Y6GqHRmXf+xvgERAu6reXo3+IIv
	SHvs5v9YxkWS3UzJNOa8XQwrMAkEE+JTfRQuTvpA85NF7v8nUtO7HQcz5Da4IVKr0d6pLF+fLmf
	k5u3uAsC8NhgezjhhgG/YCZPLnboJHP+jzTe+aeZfnu0FBriyYoISl/MwuJeBLAEgdtHXX0pKTU
	gu5cgZEs
X-Received: by 2002:a4a:e908:0:b0:65b:257b:a898 with SMTP id
 006d021491bc7-66d32fdac10mr3465078eaf.29.1770683949518; Mon, 09 Feb 2026
 16:39:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260208040240.1971442-1-dianders@chromium.org> <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
In-Reply-To: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 9 Feb 2026 18:38:58 -0600
X-Gm-Features: AZwV_QhZe5s2jbJJnfFS4JALRsv_5-7Jio6ijB129QGrcufx887IYcSq_3ToyAU
Message-ID: <CABb+yY2GbPcuPiVsE_-HCS8MbpBqvjgjDkoVLNSBDZq1bnfpEw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
To: Douglas Anderson <dianders@chromium.org>
Cc: Frank.Li@nxp.com, andersson@kernel.org, arm-scmi@vger.kernel.org, 
	cristian.marussi@arm.com, festevam@gmail.com, imx@lists.linux.dev, 
	jay.buddhabhatti@amd.com, jonathanh@nvidia.com, kernel@pengutronix.de, 
	konradybcio@kernel.org, krzk@kernel.org, lenb@kernel.org, 
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	mathieu.poirier@linaro.org, michal.simek@amd.com, nm@ti.com, 
	rafael@kernel.org, robh@kernel.org, s.hauer@pengutronix.de, 
	shawn.guo@linaro.org, ssantosh@kernel.org, sudeep.holla@kernel.org, 
	tglx@kernel.org, thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Douglas,

On Sat, Feb 7, 2026 at 10:04=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:
> @@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *=
mssg)
>         if (!chan || !chan->cl)
>                 return -EINVAL;
>
> +       /*
> +        * The mailbox core gets confused when mbox_send_message() is cal=
led
> +        * with NULL messages since the code directly stores messages in
> +        * `active_req` and assumes that a NULL `active_req` means no req=
uest
> +        * is active. This causes the core to call the mailbox controller=
 a
> +        * second time even if the previous message hasn't finished and a=
lso
> +        * means the client's tx_done() callback will never be called. Ho=
wever,
> +        * clients historically passed NULL anyway. Deprecate passing NUL=
L
> +        * here by adding a warning.
> +        *
> +        * Clients who don't have a message should switch to using
> +        * mbox_ring_doorbell(), which explicitly documents the immediate
> +        * sending of doorbells, the lack of txdone, and what happens if =
you
> +        * mix doorbells and normal messages.
> +        *
> +        * TODO: when it's certain that all clients have transitioned, co=
nsider
> +        * changing this to return -EINVAL.
> +        */
> +       if (!mssg)
> +               dev_warn_once(chan->mbox->dev,
> +                             "NULL mailbox messages are deprecated\n");
>
Nit: maybe  "NULL mailbox messages are deprecated, use
mbox_ring_doorbell instead" ?

Thanks,
Jassi
