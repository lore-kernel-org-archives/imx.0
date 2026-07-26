Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA47334F49F
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 10:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785063268; cv=pass; b=K7dveJ1mHkFR/FcqqDoxvO5eS3ap7iiwnH8ApDOLxQkIxl1OxHTYX2r/fHvBcEElyV+zGyzlpCjGgnadJ4BaWy5J7oaWeYkD3VgVCa02MJSefCWuO7dVb+TASdFU8KrlTGttSPWGmP8phhz4yRpg+hbCQo47LL969qytr2lC8cU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785063268; c=relaxed/simple;
	bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NKEGb2Xz/eANkpBgkQEWwR0qKjJoW1rZ9UbfCyBO52SZmWVbGWQMScKLXBvWOIqi0mPjECJVX8B5F8ABrfdpbXf8bDSGGhsOYIWcd4nxXi8/83GEivrvHZux0ZXahHtoSOPwLbM39bNQozKaFsW/BxLerc06zXGpkS3UQwlqUdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aB+oNkgw; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aB+oNkgw"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so1841388a12.0
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 03:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785063266; cv=none;
        d=google.com; s=arc-20260327;
        b=OhKOyn0flBKyCwEvaV+U6zmYJyi0FU7Cru3C8LHuAQasbbiEn5nxjopFxds5bMtmOs
         zzz8wWVKa3ozIRJgCrZuPQpTPzTlD+XDRz20Ber8isTggcAXOucSdU5V6BmDxtxjlfBS
         kHQIUYTqyWPibvJNZnvAoM/U7aaky/t7UyzlXM5WwjEsZSFNZ1/zEthHenhBgV38+N6D
         6ASIi3cfidEvbIv/9immlLYt8TuSs+mqiNMOwoPX9lSqbbQDafvf//zt8MvFYnW8tA7X
         vAP8vfLmjFWNNXnwSekbPru107jo1KQlPuWvIVnJwrrQVAr63NMb+XiK8WRpk3oyJjKi
         bimw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        fh=0OyGH6VBSE10PZXWMgg5VpH27JsETYKFGVRhOWjFM74=;
        b=aqQCz+hxbg7oiNvhfWMzpVPPsZmEVzOIEDocERPDhFCO1Sxv+X282KcKWr2aJC6Oz1
         px5T+5+BnHXFyMqGgBNZPRARY48WyiJPBeOhRrepz2JJI7rA8VDmxiS43qhK/YHmDDmW
         SxE/+2ekAqexV8KDAU9xAwp9lje7sNP/jJHxGbEq+4DAzl+M7yczb48lfhQpxD6BK356
         POPocyib6eOpc3v7c2svEikl3wfUkAVmn/sJ6HR06mzeXRvr8SheCL5UQVSg0BxRx5NB
         c/2mgZ1zLnzmBddnFWw4YilqOz/AG5DXbIw6T2DgexMGNn/I5q6q7uH2LELMQ16MrZ89
         3TWQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063266; x=1785668066; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=aB+oNkgwObRz1gv/vzWIbVGaWORQteprInaJzOkKsgeuxbMtGWuSQBOOEmeI2xwNZc
         TOYvvekYr5uAkDv7/eGswmrkf/VU5jY39V/qAcDRdn9uU8uFXX3EHR6X5uQWlK9w+bMZ
         YRkHUNbwAD6u4eYHjn++TgVJZurK5lS8TQzUOqGRbF6HJPRV5RfpBEDXHgk8j8MPgqH8
         PMmzJa7z9xv8F3IFEZS0cYDqIlgUADqX0ecHZl5Z248wQzacgVn+1xeHvMGSCtHnGlBP
         S/6OUZJ8fYA6ktLMuXTdQDT5maBs94+0oqRA4y5Wi+9he0WUr7C+2lszv3FB4sVX6aJL
         zSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063266; x=1785668066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw88qdhbLeJWjjRsO5YQ58HvJ0RtCrw2s4pHsHM+gn0=;
        b=HMkKplj9f9su/dTnOGFNMkrONJm3C0DrnzqpMhfSgYx108wEQXPRNt9uvgumvoQixx
         NqpM7l8EOQ3+nK3x+okjHhRAr4FXpVlfz2L+OkmO5RAwakpir5PL4ieIgry5+yCBIJIo
         E9rMot/nYRX9X+bh4jed0bkKQk8vRc7AngbzAjM3owSC3nkwzF4c4Zh7ROg7D5qJVAR4
         Pb6ukiYCZCXxUNY/cl53pH1Yrf+kPQNx7JybynMQo1KVwMFg4HuFVY3FFv6T9WRJf1Mi
         nOXQPSWJlvnYwI89znQFLh6sFldgWpq8n7P62WFpM0iXel8jQXlnMtFbrkRu+oFki4w6
         qubw==
X-Forwarded-Encrypted: i=1; AHgh+Rq03fOWkmiMKVCWGkeb7+G5Uj0l9/DBIAG2YIpW1IvjkjaItAIYd3Z9qW9lxzx30UyJCPU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+EJLGw9dq3gxZuXhjhtO1C0/FLziZS3PD7qkNPQ5VF2wKqyZF
	uo3pvw+oTLaneZzbfIPZVHXKGS3Qwn5f00Y6NQTSGN4TdqI93PthhdN20aIMe95oCJVwMEhoygU
	FjfQBazUBukAHf3ljyHLVCaSURVe8bNU=
X-Gm-Gg: AR+sD12TJrf5V+lkUxnf+qwji3AAnZDyhKdYlJ4bbClyNf9jJ19wKPW4wmKvPOd951/
	h4/O4qUGhwwbCXXCepWbyTt4mdZx1scsO4RMaFSPVJePJOLeTq1cUN4xXq6h/mcDbda9dFE51sy
	8OCtUyKDQCzyMsRDsSxrWvLrH9Xv6BxkaAku2vL2YdHQs1ZG/Hl/mbZ7kAGdd7BUQGt8/jjZQSV
	M5uO9C8hl4M4cIypFOybJow6HSpABD0+PS9Qxt5RmOGRV0kECd2Nnvm9cb2k8Bn
X-Received: by 2002:a05:6a20:918e:b0:3c3:68a5:50c8 with SMTP id
 adf61e73a8af0-3c67e166966mr4554741637.71.1785063266062; Sun, 26 Jul 2026
 03:54:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260719-usb-ptr_err_patchset-v1-0-85f7f2e4fefb@gmail.com>
 <20260719-usb-ptr_err_patchset-v1-1-85f7f2e4fefb@gmail.com> <al4zFG3zCD5FJ7eB@SMW015318>
In-Reply-To: <al4zFG3zCD5FJ7eB@SMW015318>
From: Subasri S <subasris1210@gmail.com>
Date: Sun, 26 Jul 2026 16:24:14 +0530
X-Gm-Features: AUfX_myX_j6xmvi1eW61hYxH97YPNgwMZ6bNH_j9w9hal-EVFSbaRcZHMpkAmFA
Message-ID: <CABfayGP4XpfqrfQ3qWz97yLTfjqwn8xXwW9WS2g1_vceS0srXg@mail.gmail.com>
Subject: Re: [PATCH 1/3] usb: chipidea: Use %pe to print error pointers
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Peter Chen <peter.chen@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Duncan Sands <duncan.sands@free.fr>, Chas Williams <3chas3@gmail.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Hans de Goede <hansg@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, linux-usb@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 8:09=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> Avoid use words "This patch", just
>
> Fix coccinelle reported warnings:
>

Sure, will follow the same in all my patches.

>
> keep one is enough
>

Got it, will do.
Thanks for the review. Will incorporate your review comments in the v2 patc=
h.

Best,
Subasri
