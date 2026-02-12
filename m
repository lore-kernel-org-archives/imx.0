Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493E62BD5BB
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 07:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770880184; cv=pass; b=lSVMZ+uYOtNXFYEC+sCGlm5ZQKJfZjJhKoRZAz6+5Cubiv1BJGZAITQls7h+6CqkhGZoV4AjV+FiupKdon0TOWdlQFzfHT7ygxh6KO3tkd3qjvspbjMhAQzujkKaJj3WfD85PVxsXLjO78TOx5E/a8gt6m64o7TQvH69Wu13I5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770880184; c=relaxed/simple;
	bh=Z2nqFiMrEK54GkzHQWYfhFXprKLWoPHmJuZaC2Yd5rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W+0IXscN1+s2JIfuhfJRV/oEPHCJKuEsEfEa7Z0eGDRmT+uqzYQKMaOVvsTOeAehwVOSIpAYcTZC8Y3siVdvf3VVSh7CyLzyNN6Ldgha0/jhVICcKrYKImXE+oMC7gYls3G2lLd/02Q2QcQm86OhX+YPKZUxewfcwR041btMTrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRwbiNRm; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRwbiNRm"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-126ea4e9694so2221842c88.1
        for <imx@lists.linux.dev>; Wed, 11 Feb 2026 23:09:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770880182; cv=none;
        d=google.com; s=arc-20240605;
        b=cCspdqpmyw2xWb6ch3BFmNuCd0yVxOvNIMND1LZEc7Ci7aQuDwS9DcF9nC+GBc156x
         CJ25YI8wuvOThjz8fPmbuOc7/BCxsu94kOCXRTyNQ+PnLK/eeFMVrZepv7gFAJYQcQaS
         /Hc5OQPYtbVAHIF1vjx+2bhtXqne7wwSMM1or7NXAcLPF9YLGwcoGpc9JtTUOMcfG8Ek
         SfSSlLnd+YJctupBFdJ/egok7xLwqNKYq/a9XoY0thjzxgF/bKFYnlrThGyj5jNmaI3d
         W4rqeeEUZ2IFlmvkj++P+Fz/x1yKXOyPLCcLkw43hW32EtDRNrgKmJ+nUJjbqeYr0GZh
         P5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        fh=Q6AJis1c/XmIo1af8w8ZzL5mWIjxAsV7r0TN6BU/BBY=;
        b=CRA0qk9AqemgoeKclSz7EGHefaZHol7XNJy+l9nG0hZ4E4Jkgp70Zv7NUyPoLMr/gO
         boE6bWWh0j+IepzQE3r7YlVLi8LtBHOxaWyfxxr2CcOzjzhfvpr4a5iSRpR331U98c4e
         AcvJVuPR7q8gZvkbA1tguYWzFwuwuvuzku1m9QmsbIrArZsKrx9oZhCaVYsFBDKwriQm
         0eHB8ZZKH/WO1W0M1Qk1qdrDJe0ntYPV8L6G7aZlOcy9WueJ9u1L++29HdCTkRGJ9+0b
         LOOuqQXC354G3oXdmmeOYnZgV3b2RNZHYQgh6lJQJ5dffv6U6zTmqqT1EaZBy5Y8aB70
         ElnQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770880182; x=1771484982; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=aRwbiNRmxdVRXaVw68r/VgBZAuePxKRH72yi/nsKjVeeeokIdE9ZPMuO2KyLBykzxX
         09HohMvmtKZyMfWNmDwxy4ZoB4+/EBbpBOm1WmihmrBdD+w45kK6IQg6jNqrG+g01g0d
         GTCIrDa7SLYvt8X18aHfCOFZ7XpmJKK+dmguO6XRI51SIdQiKN7awGIE7y5770bwWJax
         E/uePmtn8hA/kzsqAYNol6yRgyo6HB7Cmt7/UUlrD28xy/X7PKLrbmPtCNZhTn5i1Qhl
         2Viwn/HSjaA2OtHdFPQF6gDXA9iGDrgS/8s9dp5XuSyCt6NQAiWqIjnCEs1iJLNtL2GJ
         4cBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770880182; x=1771484982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fs5C+REHQEO0fnXAJqU+7UtASftmJuMuGkq66Fx7Ru8=;
        b=fsMqKY1n/ILwRdPcSjhfmvH3zPCXt5je6cRsuEG48G9aSw/+OW0t4qiCGkEQvWa6pA
         BunyXHiksQyDFModo25kpnbBAG4he2Vvd76uRbm3vSPb2H5LIbtSPVC4MRTQmSlrnQai
         T7LMmTzhzchuA9NoDpupdEZ27wd0uh/tpBHXGUtDS1/LOw6kybXEhBtVdz88A5NDLb0T
         WcPG5WXTKYI+6sp5m0hKTN3svMN3OIlizXsbOI063dbOkukmiPYX3rV1WRynUWA2XGDr
         i3C5nF0ONy4doJUTssALanp2+g3XasSLruVkEx4wF3uqG6hQYT+RRFwCIfkJS3Qikgex
         qooQ==
X-Forwarded-Encrypted: i=1; AJvYcCVw6arolgJUc7GTiH+/+JEkJfFpRziKh6ktmru0YWtJH0ip0cp1HboL7pCXq2wujk9lzEY=@lists.linux.dev
X-Gm-Message-State: AOJu0YznjOtGMorjJ5mj65AuzUIhmOA//4U5gN3q6sXhn9v71Rs6eVdD
	whg0QAxcKqU+7ebvyzgY/OLd+7Rih9iooruyU1HNjrH+FHxrw2FZ8FfFbhnLtH8UevrUZr1iDwr
	YpnGxKifsnCJ/wy0yC7SiU+7/iO1cCutB8BMf
X-Gm-Gg: AZuq6aIh+MSGNxXSfAALdtPwJQ3uERrR0SrFSI6RNRi5pqHSa2sOJs+fGrcxwSf6ZcH
	jLpYbdFtCOXvw67T6VKFi5s0FBCx/+nwfkx5p/tJrZySCZhDaZfNH4A11nCetMm+asum1BBcUkV
	cHm/Z09x18QuKTU10TmuVPyB+VWY/82E4cekwDPGimz1ndJCqG8vj944lbhqasWIOGDcr9Z42Z/
	d6J46Eg49InEc0JmvohmwdCwAqr+dULeU98cfzP5fKGnbSwTSEg19nHuO+GbXPcJxZdAHljU3og
	xCnOY3qTBc2ohIJhlx/XJQlPRm06yJvJGzZhvG9aikhGG7wTGqnOK7JLh/7/xo6AJ6gxDAxEL/w
	FHtOj2AeC5dTMUf+d8ooiag==
X-Received: by 2002:a05:7022:61a1:b0:11b:ca88:c4f7 with SMTP id
 a92af1059eb24-1272f796ad2mr846334c88.40.1770880182309; Wed, 11 Feb 2026
 23:09:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212053036.2581083-1-chancel.liu@nxp.com>
In-Reply-To: <20260212053036.2581083-1-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 09:12:24 +0200
X-Gm-Features: AZwV_QherBboHyGiDA8CJURenUrUDzC_HZm3EldthyJ-DQtvEc8-3hgQOSJYk0c
Message-ID: <CAEnQRZBTHt7XjCqDzavdRw+kjSCJ3YyK9rW_Xqg5xUuckOkV5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: dt-bindings: imx-card: Add dsp_a DAI format
To: Chancel Liu <chancel.liu@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	shengjiu.wang@gmail.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:31=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> This machine driver can parse DAI format from format property. Add
> "dsp_a" because it's one of the DAI formats this driver can support.

Hi Chancel,

Are there any other supported formats?

Possible variants are:

        - i2s
        - right_j
        - left_j
        - dsp_a
        - dsp_b
        - ac97
        - pdm
        - msb
        - lsb

Can you also add more explanation on the scenario for which this patch
is needed?

Thanks,
Daniel.
