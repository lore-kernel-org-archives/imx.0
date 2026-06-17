Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FEB2E1EE0
	for <imx@lists.linux.dev>; Wed, 17 Jun 2026 02:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781663139; cv=pass; b=IMQ1iQNwClygPXvn4RD0TekPbdqeDd05kYfVmGjwqUSuvxxVq1nksXzbFVDWPmiXyNO05ouxgNfn1SVszdZBnvPF7jK7ZzpfwMfakuz0eanuVZJ/UPanKZiX0W01pE3ep6T+4gdnWiRFQ0z86lAUho4TUcsWfWfapL8s4F/K1SY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781663139; c=relaxed/simple;
	bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nMXKEvLRk+G8EF9CnGGAhUj5Culb2f0PLSDmTwuZqM2govrnSJut4kRzgJnjxYYys8CrkI5TTtoB4Uz6Ah0TaByDZhYh9zUxAhO7DoUJLmEo4o1q3LtJ3Zap2szBQCmJDR+A0FxHswT2IMOoH/lnKZtFDEci2IT3QhsoSIrZNKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0c6mbuq; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0c6mbuq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-842848fd613so4513351b3a.3
        for <imx@lists.linux.dev>; Tue, 16 Jun 2026 19:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781663137; cv=none;
        d=google.com; s=arc-20240605;
        b=RkM8bGEiBEEUKedZGJd83NdaIh7l18gp/s7bv7uI2qGd+FKQ42ZAcdGD1JQ56EDg1W
         wkOzMr+9s6w8E8QlXzny/0AyNw4v3O5yK+UpMVLyD7G7wZK9V19TvTYBlMAKpur586jF
         RA/4Vba6LWAu6HBq75WrOzQLtQ6CsRBYBjt1FRDySNFWhgkioJNXwIAwX4VYlL5RZsky
         d77AoIlgBrjQR1KNy+73Cy+aZQLEU9XWUQuSn9ZGvQXVtg2fmRqY9Nz+ZguTlAgInkyo
         NazTuJm2JntJjOjbLNnO0+hcXUv3fXDFbOn3a9w7hS8b4unZSH2QJcPnhm13sRO4qN/E
         PyVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        fh=FeUhAYbb4vnGwRbWoA5cnIuzHWrQ9CVaZxceyywfCWQ=;
        b=hWXKB9TAu9rGr985TSCZqaPlY1IqsHb1+h27/G8QN3WoSDA5k3zQX9zsawhdBiUdpD
         9uvPcPZnQS1GP3avXmlPKBSu1x26gkpAMmaGKZr10XsuPp7sfzO8fZupmuG3bFXK6XBs
         tlmZ487ReqvqmfoWITzglCNyqZI/C8RLYTCFFfCcCKbpS0/XtPOaBam/34dIKPrOclHs
         qC29+YERfNhmckNLooLqFfEnvqOkgeQNLvdvmmr+JxNW7NPgrthFaoL8tb4EgzSJzbJk
         tiEIS6ViO4miSWMby+XZe6yHmLi9g5h/co8TaMiYxD5ujrIglP9aLqdFdUPTydO567VH
         Wp+A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781663137; x=1782267937; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=R0c6mbuqVYCX9UkUo0ZuQsGt8VIoUC1q80AyOwwF/LjBwFdwNXoQIoVMoWad1VpAYc
         WxeQujSYgvr0APHKhm1tpFAs/YsBddy2htUY7LJMrPG1857rfTBBXZUtec0LyPaB/lS7
         YKt957I8WDVzWiJ9MZBdmJjZAgZ+eQyN+3i4IzX/+im7xnlAGyTJzWUVEAf8Vv0tVrWa
         bfisI7NGLi91h+IBG/AOOvXzRp3Ttnm7teVa1rsGgsOTcCmWrv2evUUumQqQJvzH90SW
         mN+IY1NQmu7U5dbJc20jZAv0zARxagFl6auSNs0MMBhAqzcneUwC5UHJjDCyvj1mGrhV
         /jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781663137; x=1782267937;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I9jkNgg69cYp9Gmed8dyPc4oJRxJqglqMoz9LIyCVkM=;
        b=sezqnz9EbPX452NUv8YbfQoK4J8tvs887961TyQu5ujrPzCtQbLp7+eClcSpfYNXaH
         u/HGrkOL09BcJZbwhETNf6t9S2F4WLnQPCUleTdWLpA/OIUAupIMEbFa5YwzOp7O95Wy
         BeqKPkVAXwMHwhTtWu/m2RilMVMYsDJ3xzxjSgYRqqGRnwtTJpq1bQUZXnK+PDKr9N/c
         phlY/P85BdQGlnoxdO/5tNu1N3ItrEx8LRtfRwA7KKlkl1TIw0Ze75imeEzBygrb7jW5
         bwWWdilA579f+9Q0hdyDSegvpmul+qGRf2o3GYQlnq0cSb4L5MiZApwdfOYkAIS2Tpjm
         MmVA==
X-Forwarded-Encrypted: i=1; AFNElJ8E5v6bM4YibZnQ1EC2vZcLkxH77hEE8aScqAe+FndqceiWiBt9HtMGnUuqc4ht/Z04FDU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCcQPALN84kmQ2HZLCR3ausNWlQO2zE5VSJCxrLCaYwmqiG/ow
	YyBW5NF1kxZqXsDqKT6a+qDZ0AlCM0aIA9AI5cEjoxGhMiB8fv4ifsxKTECjq6oyiJmomYmq2IU
	WIj1TwZsIFpNmT7pPVhdFQZxCOxkoBTk=
X-Gm-Gg: Acq92OEKJ+HlKt85SRN70iYRoUuEAbq0chnTyxAyl/6B0GBtWhfF/NjzXygiY8Fgcuw
	eNJZAI+VM7Iu0fihM4qXaWxA9uaPLUg6JSntPdChtY1sUV0sfdZWVibodcIVxno0g+OeuvOs1hi
	X8Or7UCTKK9IEfJ49STSML3R6NjrYwSv0ibcUlFxRHRZJ9jt+j71uxG38kxGjyFZI2/baaA76+E
	OXdfcxQ7RZrmduQty6oXA+VXZI4jrmgv9o1DxJFxWTdMVjzxk1qIpIMZ+dSUhG2TNJ+rjYacFh1
	OOD3fwUw7MciKVBGn01zNePqAN4=
X-Received: by 2002:a05:6a00:b89:b0:842:5da3:9b8b with SMTP id
 d2e1a72fcca58-845245994cfmr1624839b3a.36.1781663136820; Tue, 16 Jun 2026
 19:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
 <20260615093824.115751-2-phucduc.bui@gmail.com> <ajAJt-EV1sSfG3OC@SMW015318>
In-Reply-To: <ajAJt-EV1sSfG3OC@SMW015318>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 17 Jun 2026 09:25:23 +0700
X-Gm-Features: AVVi8CdoNbD47oGFTWSfJEm9Lr238WEoMJ3mqPMc2xN9snSeNNUZupbWD1q6iqo
Message-ID: <CAABR9nHNLchAnkeuGrDWoS4+sAKnqQMgx9b0cuv7rOHzC8P6Pw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>

Thank you for taking the time to review the series and for providing
the Reviewed-by tags.

Best regards,
Phuc
