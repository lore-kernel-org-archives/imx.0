Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2957D372680
	for <imx@lists.linux.dev>; Sat, 22 Aug 2026 09:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787389683; cv=pass; b=lqiHj6yBa5qvJz0oPBqOsL8rQ6Xoi1odMGVATwArTE65zQESzwvyiIQUcpmD6m/FbigV+28cJW9MGnXqZlj3YwzSOkVWuAsEkLXdgvOi4jQ5uF4VhrQWc7GOlxZM56JfPrweqI4EFleW50L8UhH0fV7NjxMlIr7bSJkLEiSaP/U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787389683; c=relaxed/simple;
	bh=LSY6pZTY0pN1XLw/IWutO45ypUvbEMPOBZu3gQ9gNVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5g7+xiJm8/LJgM4GRubujPqbjx2P+IythVplXyjwx3fPHmb65ze6Lv8tcP8wHwhyXoVSVTpHEY4FUbQFf4nHYOpzqAY/n/EIe9tBwyi/4Hojw4mrkJxzdyvrrUMxNFdBq42Vth5afougnWlbFNoRRRce1VhunAC3/wshFn4gSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HaOKHHNf; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HaOKHHNf"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacb8416a1so16598225ad.1
        for <imx@lists.linux.dev>; Sat, 22 Aug 2026 02:08:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787389681; cv=none;
        d=google.com; s=arc-20260327;
        b=jKOf9PRonPVxOp7qKArxPClNDWw1LX0M0q6vvMrD+TlOWUZTrfE334ItKAE8oOiF53
         wTotxcAwSE+ewShNFBg0DMxj42qtrA7MhxqiyhNxzLwn9JtMUiK/X+HCg8WZ5Sd4oI2k
         aW2NknwIYNXsowrnI6y7fUngnB6bZ/w7ziZ3Dhbhj2dR4xHwWnUyaXwLmEctgJvXFARz
         JuSH6T+gMJVI3rIshpiyjq67yt487rZWX8CnixPOa8g4B/59fVEzd/4UqTgkAx3t9beD
         HJw8g/wht2k8AAd71EhN+eX+E3mSosbQtea/EvWKndLL76o1iaHaKmVqbG0EdggBApq6
         layg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6woqWYh79iNFHKYUnyFN0FJNuKmn+PKqFBiyiz14Gxc=;
        fh=8bp3Vs+ezTMfkGlQzQcet6prl8Nv/p2OFdKdENFm/qc=;
        b=EIPmkZ84EXU/Avy44b96GOeEBrqdS83tDqCRlJtCoLyROMbOnNtYmM30/1siewBCCE
         POTBCd9YUahLBj+GzBOM2mwuF9gkuUzQUomkS+X43asRPOd/FSGDvwfHbfMFtwZAPYQg
         2eQXxc8ekArFRn/xFKUUBA3HCzXZbH4l0pQH5E+shyKU9Gzs9kZAus/ZkxDvQ146CUei
         U2hCdCPwO8fBwNbWZYYqQw7nJmjBtlqe1LdaV6ufK1Ow9QgjqisOvbKt3cm+o3JAArXw
         6SesDcXh+JXd0Mw7Uade5auuP0GKYa9FdJLzZb8A0micGFubfoH6VRSr2CzlPDd87vVK
         pyqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787389681; x=1787994481; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6woqWYh79iNFHKYUnyFN0FJNuKmn+PKqFBiyiz14Gxc=;
        b=HaOKHHNfk7mow7uFwrx/GsyWUWJWhvzevse3eumG6qohb1vs4hpPtYJFabGKLfArQR
         VQTtrgI5JYJMb49xH3HbSvLrfLRZpuuRszM1LGYdo9kNM6UX3Cs0PeMvTkai9cQPdNiB
         muc97H+0J9MKKroaSw7K1LdQGBmFU5KYgZAcTNrt5KkRY+pcXY1gQdhU2/eclmhzpQzC
         ZDyiNpfRPSvTELYyMVKwcchoIxMhpYko1CGqnPzMvVTgmO4/JikmAAV9j5sTOTovQgll
         llBSWe6WFO7UZCQdGEASDsXhTr2K8zJPfEpqr4KAjyquFNBJzaNgLzC+Ug9XSjijAqnK
         i7Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787389681; x=1787994481;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6woqWYh79iNFHKYUnyFN0FJNuKmn+PKqFBiyiz14Gxc=;
        b=YBPsuTKwuaB2/CwsVQP97Ob+zyq4VNA9CdEDdo4I4dkaFiu96fzvChzZSmqJtsVTOH
         bB+gyTiBSMB1J+fTjNCZBMt1Dk2HcI3txrrBJgWMog/kDpbVUK3zV0HFmrw28t39QwqQ
         4M0wmBNroqQjHe4Qlqtt4IqgPI5WE8ss1lZmzdo9fKUCLmdOI1UYOO/pe1QytGBj/Wtf
         Dldx+sg3Is4ovgNtDDzakFSOKPHEVlKChb1bP0VBH4Yr6Nj8T/2S8vBW5udt6ZpeVxG7
         LmSlIk7yMDe6Oy8Dlb9/KmMzeHGNUvBAbPbZeaSZdftsratsa8tk94qV+af8SF/T4WNT
         WECQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4u25F3dcsPKpTLUOSyQFwzyrSl8+YC3i4O05hknjnMtopDA44MrjiRu+GAFmG5NtoJDo=@lists.linux.dev
X-Gm-Message-State: AFuF++k+++LekglCEKvey/kiWy5hzKhY/FGQ5DOlKbKNuYyeXZ7F/zoU
	5gcst4vjxMYDLnuhejaRoQ9X4xJQGk1iVtBYwS4ayVRcRhMtL7tBu61haiwtxkC4YGqaHm8uP00
	4MrfkdxuZeCQ5fq4EVkQQv1k3K2WcROs=
X-Gm-Gg: AR+sD127ttLHmQAQ5aaZcVSaV790g3T3yxsU7ERf2rAqrregLzXCOqh29L+aoExw1sZ
	upnAu7EjlNPLQRWS5bL2sNptTIbCt7RF2oqw4/F2+lnjk1u+2zGLeE6KyZqSQZm8R+G5tVXCiOO
	gwcJXLAeLNOzp9Y5yAbLmXt2ZxpeLDobN9MnupMJx49Xyxqq+HlX/nGSm8ugdaoi6fyU7zjeJjU
	G42kG/qW98EoDTza+1cj2UgU5eyN6jdf6FE37lzDp2H4TFwObguRcr/UoEtzpEkkZL+PZSTOosH
	ok1bz7awGyy01sMP15fPFoENLRS8Ebqy5aSH/oqodqVwBsILDNju30ghQa6E7X3rpEJ7cX6k4tL
	SxORiXOqbfV67kAVy4JI100S3GkJnbhU9UkHBI5U89jxBpShxSULiR3/TkqODVRuYtdlu1jKAIO
	HIqqSE124Bw8TRnA==
X-Received: by 2002:a17:902:f70e:b0:2cf:afa5:b19a with SMTP id
 d9443c01a7336-2d64afd7c86mr244956595ad.11.1787389681421; Sat, 22 Aug 2026
 02:08:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260820111416.97917-1-phucduc.bui@gmail.com> <GV2PR04MB1173976A5DA80B2816493C84788A32@GV2PR04MB11739.eurprd04.prod.outlook.com>
In-Reply-To: <GV2PR04MB1173976A5DA80B2816493C84788A32@GV2PR04MB11739.eurprd04.prod.outlook.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 22 Aug 2026 16:07:49 +0700
X-Gm-Features: AcwNN1VGh6KPneuM_bjYGwgQLpofzFqg25qsf12ZcvTaHcRYfF44Rr3qalHtEew
Message-ID: <CAABR9nFeaLMzk=2_HGvCktZwU7DmNWsHV-vHSBGwbWU8k-TLfg@mail.gmail.com>
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

Thank you for your review.

> > +     if (irq > 0) {
> >               ret = devm_request_irq(&pdev->dev, irq, fec_pps_interrupt,
> >                                      0, pdev->name, ndev);
> >               if (ret < 0)
> > -                     dev_warn(&pdev->dev, "request for pps irq failed(%d)\n",
> > -                              ret);
>
> Why remove the diagnostic log?
>

The reason is that the error is already logged deeper in the call chain,
after devm_request_irq() goes through several layers, with sufficient details:

-----------------------------------------------------------------------------------------
return dev_err_probe(dev, rc, "request_irq(%u) %ps %ps %s\n",
                                    irq, handler, thread_fn, devname ? : "");
-----------------------------------------------------------------------------------------

Therefore, I removed the diagnostic in this function to avoid duplicate error
messages.
If you prefer, I can keep it.

> >       if (IS_ERR(fep->ptp_clock)) {
> >               fep->ptp_clock = NULL;
> >               dev_err(&pdev->dev, "ptp_clock_register failed\n");
> > +             return PTR_ERR(fep->ptp_clock);
>
> fep->ptp_clock is set to NULL on the line immediately before
> PTR_ERR(fep->ptp_clock) is evaluated, so PTR_ERR receives NULL rather
> than the original ERR_PTR value.
>

You're right. This was an oversight on my part.
The error value should be saved before clearing fep->ptp_clock:

---------------------------------------------------------------------------
if (IS_ERR(fep->ptp_clock)) {
        ret = PTR_ERR(fep->ptp_clock);
        fep->ptp_clock = NULL;
        dev_err(&pdev->dev, "ptp_clock_register failed\n");
        return ret;
}
--------------------------------------------------------------------------

>
> Additionally, the second patch can be merged with this patch. There is no
> need to use two separate patches.
>

The error propagation part in the second patch is directly related to
the first patch :

------------------------------------------------------------
-       if (fep->bufdesc_ex)
-               fec_ptp_init(pdev, irq_cnt);
+       if (fep->bufdesc_ex) {
+               ret = fec_ptp_init(pdev, irq_cnt);
+               if (ret)
+                       goto failed_reset;
+       }
------------------------------------------------------------

So I agree that this part can be merged into the first patch.
However, the change in failed_init is an independent pre-existing bug:

-------------------------------------------------
 failed_init:
-       fec_ptp_stop(pdev);
+       if (fep->bufdesc_ex)
+               fec_ptp_stop(pdev);
-------------------------------------------------

Therefore, I think it would be better to keep this part as a separate patch so
that the Fixes: tag can correctly identify the commit that introduced the bug.

What do you think?

Best regards,
Phuc
