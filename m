Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638FB339382
	for <imx@lists.linux.dev>; Wed,  9 Sep 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934938; cv=pass; b=X/p97JFAKnXsMQOhoOdHqRi34VR68DEwp9kntuOi9HAIt+5kbQg4/HW1pXi0j8BktCl7jqBRAxeaXt3Dt1Cl7AOuo3BdAs0BrGMROZ39xzyvtXfgLSlTQ5u8CAHqUqmZP1iaFsQOAzAeiqgOGyPpDWSiCSQu1j4WqRlJ8skC3eo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934938; c=relaxed/simple;
	bh=ZUMAL4Md/OW/2i7TX6skK5sRb7fbFz1d/4ElfK5ssWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L1BY9WIav+WHdCcxvyxR9IpI23cs3xEoHL2TXevhhPtaVjGsCklI3jcTcq32OnrNMlOOwtoUEe9HyyMVGMeNfLq/rtVxcAAnuQQiESKFYshbXGWWA0UflBhe1XzZeRE3Eex6nH1aOfFhADP6jG88EwEEHGhBX4i1pk/XNmDAttA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=svbactPX; arc=pass smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="svbactPX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d94c868ea5so55396915ad.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 23:22:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788934937; cv=none;
        d=google.com; s=arc-20260327;
        b=Bh6VjcKq9dFCoAqGIbFQSLZmHJl5GeC/GvlHOBRLKOoeqSyikIdJEXEflvkR7qx48/
         BhVkLlHxizIMjHt+DO0hhOQKqcs980t4C3EbakBpr3BqzZYR35sCP4iv97TM3I/I3PqK
         tQrOfP+fczRyxhKK0A75k5cRHuQ8cmgHDeZxZAhTH4t36bCG3UWozIHNUwhsh3XukY8q
         iguU0/uVRImXHcu3fql8rwvY04cgNRs9dZCik16hmO0JACfdMc23hvWkyqpS6wuX50SC
         esuF/ZaY8umCxqXbdijRflCtAUZTEmFu5Zdevk07sIDyYZVS4zLEkmaxKYzaJhFJBUDL
         eLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        fh=5o0CucSJ/g6Iy59erBcWlF49QwRoBPPXR/JFzBJqcg8=;
        b=L0pUUFhYQSXtZ5yBlWf+gjAjtxDgGiNWcNsE67dxL+GH7G/inruZR9hqawsRacDi20
         LoX7pNUXBURTCn33CH7mFvzpyT08iqIWRFElpKO/hTlrkjCjHJJpW9Z+clzGyYu0woUC
         fUppw1K0QTwl8vMn3tCQDEFzdxzfxXJdazbtmyfJzwRMWZhSsHYMimIKT+mTo7pcoTip
         3AK9ctLfdG1OVuxb5HC+NWQcNLH4LJ5ESBBKnD0O0CEfKSxIi17jIPraO94qG1cegJ3H
         XuZPsV9++Hi7EdO+OYjFYg+CSxnwFN3FYhaJ5e4KaxOAywQzONenxM4rsRegwySPKcc5
         36sg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788934937; x=1789539737; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        b=svbactPXSkTfqLvvjKBuGolFw6+cH20M4H9VGJwfABmxKtSni4NdkJmdvbOFUDtmUU
         wkSx4BvBY9nGKPFZnyyXomtfVrWsPINEKJ7U6N6ztcrP57ya4ca3Jumw3ZWc6P+w4ycO
         HTVYv0cC/5T9KRKkQcHpoUOlh3/kc3r2wmzydjyBYt3nw0eOODfFu/Fbvw9l2visOiGk
         khMXb7KpHbgJcakkuJh0eGd9/T0UvYpsr9CqAaMdT5F2JMxS8HdvERoNYl+fh9kSxmk3
         7SqG48JXB1MFz5K2dmwlEGGFwmXnjF8r9JFZrRBQUO/wNaG/D81vgljZ1McCEWGKSrsm
         ps+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788934937; x=1789539737;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWM6CeHEk1aJXSMMdnevLIa5hIVREi7SkJQJU6C6uoA=;
        b=H5he9puQkruMHKeaXtiPTLT4mrDoLzNf4r+/LGF0CFSXy/NCD/NDdmOxsK33/mpS1L
         gllEY+9rRQPBT783J1kocyAVA5HDmVJEK5lrmWBVFxofDlmKAb1hCdrHAggshkihuawe
         ZF/LNTPrgOqcHfJP6EuQzJAWtcP+xG/lJKdRQ7xuVGYQqBpQfOQyKN7cIWQUxtwzp3jU
         PbRhwHrtUKrYiQlhzaf1ubF0/VkDi6JA41JIxHmE/7nECNdjKZocajiokbPxmZT3/FWg
         pZKsZlVjJ42tRqVuqGSex0xRGENTd5hw9B5Nj/ah67I0wpIeS0jXN86e9bj3fNSfiCAp
         aR9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxce4knAFndca9F/tQxwfpUuiQiNPqt6jr/qRn/dXO9ZxOBk5kcaeEcRFmbokludqXL+9k=@lists.linux.dev
X-Gm-Message-State: AFuF++mglxO3FWxXw+SknDWvQIMJsK6LrlMbWhl8Eu5Rj8q75I5ZCESN
	g7WWasODfa9NThUq5y50UIcxj/KCSXR7wlOtwAwfazeJDMcvG1oIzy4Y9uH56LJkTzf3vI3VM8D
	AEsZkgEx0QFRIWLdqFpWUmzK/oHZgcVk=
X-Gm-Gg: AYBFou1ltN2tlQqCfUEw3mROOnLm88EYU/gpEuN+ssEBamvSv23FCm804wuZxU9iq2c
	16qUCTjH0DgF/uh1ghjA4Zt6iCwQPJxOqOAuRBPUU44/SiUz6BA1me+lUeJ2E4+a0F2M32pOhhN
	6sJZ25D/tfBKpY7FGjVHLIUKn0FbYTcjOuz+p5SnX2pzG27lvn4GeedENZF6X350f0ELmCAymk3
	WYdKR4owAXtSKqylsA+u0/xipSUEG1dS5oqHfBAAp2U2YH0OXIAyRP6eW4kogTKGFlQf1kSPU54
	VVOui0ykUGaYATZCdmm3y1qdwmedrLHvd7EpVknzvXkUq0FEQwbnBMNP7CMRduN9G2ahEiAZwId
	D9IjV3wyOo53mGj7KQiN991n7c70ptetshMSYkxaBhszNRmni6tgQJ+RK/7rdXcymFKQ=
X-Received: by 2002:a17:903:4687:b0:2db:733c:fd1f with SMTP id
 d9443c01a7336-2db733d01b1mr147964695ad.8.1788934936683; Tue, 08 Sep 2026
 23:22:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909-fec-ptp-pps-event-uaf-v3-0-bead12c29a16@cherr.cc> <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
In-Reply-To: <20260909-fec-ptp-pps-event-uaf-v3-2-bead12c29a16@cherr.cc>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 9 Sep 2026 13:22:03 +0700
X-Gm-Features: AcwNN1UJle0sVjQuUbKVCU6-l0sg65xDQ67_7YzJFG8LlrYIbdhc6pOpj-B036Y
Message-ID: <CAABR9nGshJE96aCZVriQeMd+7Zjua5n+EKpUTN=953sowUL0Tg@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] net: fec: free the PPS interrupt before
 tearing down the PHC and netdev
To: Shengzhuo Wei <me@cherr.cc>
Cc: Wei Fang <wei.fang@nxp.com>, Frank Li <frank.li@nxp.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, Troy Kisky <troy.kisky@boundarydevices.com>, 
	Fugang Duan <fugang.duan@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Simon Horman <horms@kernel.org>, imx@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +
> +       if (fep->pps_irq >= 0) {
> +               free_irq(fep->pps_irq, ndev);
> +               fep->pps_irq = -1;
> +       }
> +

I think fep->pps_irq > 0 would be more appropriate here,
since the IRQ returned by platform_get_irq_byname_optional() or
platform_get_irq_optional() cannot be 0.
