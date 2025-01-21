Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDF31AB53A
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737451172; cv=none; b=WywqnfKlCJEW9RTN/Eb/0IhZKczFHAkusz0+awHlMC1PaBs9kDPxZXClBodfjSBXWkhmu2VWyNhhyZn5G+bkOiX7QNjevl2M8DuOttAnliIO5r69nAg4pq1DKQF/DyVChyAOyeaOq4MMe8QQsEDJwss2ERXFxQirIV4UkzBj6r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737451172; c=relaxed/simple;
	bh=4or9mCMAkvG98AWZ9qL6deZsW30v4tXFZXm8ywfU/WA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fS0CZmgeHsibYf3gFPPGnrhU37Qz2xaKJaxa/RWwpy29Adh/2I+AUTRig/9aEBB6K0VM7yk7DeVLksAvgW9P2xSMDCj6JFLQUqtR8iEQ3N7Uf9vDc3zziDp8Y75PpxeG8xQSPUjeTTTc4do0psFWT//1vd3YX3pOjGuLuc+gZUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpOojbSb; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpOojbSb"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee8e8e29f6so6975945a91.0
        for <imx@lists.linux.dev>; Tue, 21 Jan 2025 01:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737451169; x=1738055969; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=JpOojbSbTL7jZU9G7Du0Lwlew5on9SAXi0drLaQmuTBKCbPAumvgtyJ/bS8euJVSPO
         RIcOzstUk2PQW3e6EppVwSGToqzQVQ8G6iI/77kpjJM0dfWieJW5n4tZkE2GqFfe3rFc
         SR9Qko58QUs5jgJuP2o331cCYDCOBcFq+J1J0JW1zY9V/D6jjt7fc5gWZ7laOO7vSynz
         +kgjPXXXzJi3IiBrRNbgT2YB6/pSlOrKhO2+jD4SPHNcwW+HBeZzgW5mqyUhDdXDE0T1
         QbEDL0YUMvr/aAvoekntCo5F2aotJr0uSdI/1h2GEUQcpRRJGt/pkAo5eE/vVRJMyVLb
         VHhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737451169; x=1738055969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cmLKgAbd0s4H/WjP4JEXIpMzxpQ6pfh6XVvXVJ8p1M=;
        b=Fo+g8z4ZnbXQIJQISIM0ScZVZ+Y1mcZEyDrQjsDR3DC/2wvRZugKIFye6WLuTWmn74
         P+rpv/2ntDtWpRe3gXyDvZH/6cVoP8wHBmXVtmX++1L5CucUGqcP+IuQBbX++mFN/3sn
         /F/VraLCvhzJVEufHJgN+11jbJh+rJK8MtugkG2ag5WONRB/OIxNHxV32FdNZkF8ua//
         25J1UNfeaBWbJi/J/kvqlZ3RCc7/3jmH4MQnm9P9v5XdQVf3Nc1ZPLIdCUfe2+obSc4Y
         F6vo1PyArnFUU5aEbrh4DHLr17ZjYXYAv+vKHrr1ygP7YAbOWDR/8M+GdgaxRS8HAWoO
         h+ew==
X-Forwarded-Encrypted: i=1; AJvYcCWUwHmpdJ5Yh8PzgB3yRCzivX8uUem/U/IolDC9R2CO9y+D9/5+gjilG2tCsCxPVQ/4hHI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzD/EJC3Rk6GaucaxIs4Xu5nUZg6Dx0xPU/GbkZpYwhxiARpuIi
	6GP9RR8Z9i8MbDp918AF7zDZLUCna+23ylnKUjQveb7cvD5iRkinnjz/6LSNdQGyt/7WzyMPh+C
	i0Px6GX2TPPKZguHpa/NwJlRbfJY=
X-Gm-Gg: ASbGnctplIxJ5lVHOxrcVs/EloREvG9LW1IrhZh5OZy640z3sHRJ9BwFr1yrC8MZUc2
	Q00BJjfIbW84B/WripFC71M9JEud6We56Ien1a35r/6TI0V9bxqvKhrc0V8fNJD9UdQ==
X-Google-Smtp-Source: AGHT+IHGWqxvT9gpiCi2M50sC7hANpRZHJI/Fb/4ZsNlfTW4QBH+d6oGf9mhsqDy2J8HXKVAlymqclIkcRr0VJ3gbc8=
X-Received: by 2002:a17:90b:258b:b0:2ee:f80c:688d with SMTP id
 98e67ed59e1d1-2f782d4f168mr22914331a91.25.1737451168941; Tue, 21 Jan 2025
 01:19:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <AM9PR04MB86041F11E6744FB41C40CECA95E72@AM9PR04MB8604.eurprd04.prod.outlook.com>
 <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
In-Reply-To: <1f7289e7-8e5f-448c-a443-2f27a43e640e@pengutronix.de>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Tue, 21 Jan 2025 10:19:15 +0100
X-Gm-Features: AbW1kvYMf3N-mBfPacW0Bl83nBf5PXk-cPJ5NgOebdXSbVXyMxjWfW3gWa_3_g4
Message-ID: <CADo9pHhNbq-i9r8QwkCCdzmMf6L8QNiiKmzP=sr=M8=YfsJcBA@mail.gmail.com>
Subject: Re: Recall: [PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave
To: Ahmad Fatoum <a.fatoum@pengutronix.de>, Luna Jernberg <droidbittin@gmail.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"

That was what happened to me on Gmail, was wondering what this was
about, thanks for the explanation

Den tis 21 jan. 2025 kl 10:17 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>
> Hello Pankaj,
>
> On 20.01.25 10:26, Pankaj Gupta wrote:
> > Pankaj Gupta would like to recall the message, "[PATCH v11 0/7] v12: firmware: imx: driver for NXP secure-enclave".
>
> AFAIK, recall is an outlook-specific feature and most readers on LKMLs
> will just get an email like quoted and thus recalling the message only
> adds noise.
>
> A single reply to the cover letter that this was sent out by mistake
> is enough.
>
> Cheers,
> Ahmad
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
>
