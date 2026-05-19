Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDC23DB33F
	for <imx@lists.linux.dev>; Tue, 19 May 2026 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779211549; cv=pass; b=DVV+9vQjyHzvWFAUA+Fx9lZVwGOYwO3G+BKLpv8ZHGLQEfKIRDcXSM97woTEuxjSJV9H/o8ofxTVj3e5Yi4i6IZ1wuVHHMq9SmK0MMkX6FPw5Y0qkWcJt0Gllo82zBpYhrLUwdsEiRAtay9kbPwQZKOCP4fGkGUyc4hbVXxFnF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779211549; c=relaxed/simple;
	bh=FnPktEvpCBFBJ+TVc/ni/S7t1B3GKoH7YXEfmoTGm+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2Rf/UcWcB8iJIT/XKrgJmoBidEVbPhHhHyrQzkBjeRRhrbGNiiQCgPywbLsnPktlTy1o/khB5XFB5o6FLPH/YyZO3bYtfjP4thtm36TlEsBJ8FCBb1NbSX+gUYnGaddQtIbymdnCiKBA5YxJiISLqDQxcItzpILmtnCMedGzHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gZLMDZ9p; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gZLMDZ9p"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2b2e8b95bdbso225ad.0
        for <imx@lists.linux.dev>; Tue, 19 May 2026 10:25:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779211548; cv=none;
        d=google.com; s=arc-20240605;
        b=SKtlZnh6PFQ/YLSS7MUcfgb0+kgQMboBee7ptXBSTgs/bt4zOnU7RtlkI4bhAHVRUs
         mCmPj4Q/etZZzdA52lOby8lUKrP9hMVVuBHYXLsc4D7Hlw5RpUJ6UpiklSkn2pfS7JQ7
         2gyRbDm5V37yIkr7AUiMqBrMJSAtOqNjmHp7YVLegHDxrb8NQi3L2nDnw1sxsPdUv1JQ
         PdrsTqL2Hld/NT/OCt8Jf+llJY1QLNMqhqPfmECAb7uL5554ykO0H0UvdTZ9GmLKejPt
         gysSPfaeXadtxAeIks4r4lNesK6baAm1Kv5AxMJUn87EMgN6TEKg0edKNSNh5GC5j/P2
         tq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CV+8xJFrBwz/qANfkgIkVL8z5wQmlbcD9O/MI26PWGE=;
        fh=i3m/y7++O82H+tq8iyYrbgm9RU4IpNMbXFF+TVWODAU=;
        b=WrDi7WOq+dpYm1imrOHYoR2QDj7U2VpHDXZshC3/CLVO9rTiWj5TygKbDva7ZnUhKB
         PnzMmZgBg8brLp2JK7xhOo3YLpxre9dG/XKrw9FefuH05hPazP4/vHXFPInLaSAbMBrq
         KG0IUe7Zl9+U9VIsrPA/iTPmR3Q7nJbhZzEc3wckIhWzF+96dj8YIR7pM+/ruQnhaQaN
         uMeNpjUAU9UEVf3uvcl56PHsbBEHI/QpuasUCj60019ymzyMKMeQyJioAgunBtP4iB37
         CqEwQNnn01hPc6MSJalNIMYsNBawH5qe5jn1zJEW2NOjDxqVW2nKIUNZu6kD7mBbXtVd
         XQ4w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779211548; x=1779816348; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CV+8xJFrBwz/qANfkgIkVL8z5wQmlbcD9O/MI26PWGE=;
        b=gZLMDZ9pZ/p8040HbjV2d0BRrqG5kroa9Lgslh3DZxhGkbkr4QBeKSozzvwtBkBhR1
         Rysi9F0YvMkSnuMYX/ERqN7j4MTiSSWjiIEmPieft0Pn7ZdnHUGgOsWyW2U9pASTibQ5
         b9JWaPxjc6kMQRqXXxs+Bp9K1lGiEqE0YN3wPTQG555IHygw0DwhUgWLbAnOOzz1leiK
         TLkQ12Rz1ilKg+ta70OsbLYmFfnXFLrDQJV2c9Kv+fgIax3QqWXNlPmwpNCtrfYv8Zlg
         C1uo2DG9KsorQdqEPTE1gWJwKw0+hnE6FjdWsXY9w96oAgF1cV090h3cC/bOXYXrpYcE
         c+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779211548; x=1779816348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CV+8xJFrBwz/qANfkgIkVL8z5wQmlbcD9O/MI26PWGE=;
        b=K0vI6dqqjfEaIydsVhtqALZ7lSFf65PXa2lTAZv7nBLMz5/QmPvXGaQvK0xBjywocd
         zCBrmXB+EZuskjcdDqWsmu1ccTfMux4/Bsa9MGd1DPGXlxpoJlS/5yZz211FmvQtEnoa
         nH2/y1yZmYRKgjUU47KolU8UVenhx2i4n1Cfq3aAGHculn1Py+DpUE1X3WDSUz4BolpG
         PWCFdKG4cF+3BpfOYbgbEjZED271OuuvO49vP2JXqpZxnUMvn1Sl7sMZ/NhtylSrz+oQ
         YfLEdyNRij6XPVLkHzuGyPBGE3a2SrqX7pMCiawezQNAHGYvuzWmY586NoYf3A3lM77K
         GjqQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cDTNZHZRIbBCmeHMuEOQ3SILx9m08abftz0JcFF6+DOBWBAw5APvu326c4KPjEr4Ikqs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0alHbC6D6AUPyiY6n/Py2IUGkoiCQ5aib/7UUNQbmZr9ll0Pg
	+13rp9u6eZJ+8q3FKLcvJy7bYhdCQZJbdxfB68umjOKni7AOyUl6DAorzQRH54+JrRATEuYn1YY
	HqplT8GQUlAlWpPIaZ60BaEURiXlSsc6cym+kcFPt
X-Gm-Gg: Acq92OFztnq9S61et4xQ5KKYyIx35FokHvaBnxYQ9A8ZNWESIXFeovrrm5Iyj2+qWeX
	OlSsdcpMYYL1ydq509Cg2nWWsanQUyryv3s9urgHxxLW8iQ/mFAJKzuHsn/Qeb0lUh3DixDbO1n
	6kGOV7AQEVVHQFav84kR9H2LCvGe6L8K8TgEL26qkQAX8xlYtM/XNhxUKISsYP/R2b9hpvdfxZl
	t/KxJ9frM9tlUT0lvlzAB+byRHr0T08pWS6xhio2NwGXSS9rnorPnaVCoTC1njd1zb57MlHWrNj
	aFa+HdrUww8MSygmcRCksypxp1disaoFINebr7AXkELef1Z2A0FTbd0ayPngoCnW8lt4NfvNnyn
	jT0xFhSsNVZOVYEwrD25cEoG5PpY=
X-Received: by 2002:a17:902:cf42:b0:2ae:6755:a24f with SMTP id
 d9443c01a7336-2bdb0113ddcmr6591515ad.0.1779211547151; Tue, 19 May 2026
 10:25:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518030535.1057228-1-wei.fang@nxp.com>
In-Reply-To: <20260518030535.1057228-1-wei.fang@nxp.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Tue, 19 May 2026 10:25:34 -0700
X-Gm-Features: AVHnY4JXGWfpYwtEwaQ4vNriEAea_KorNY6U8rnaMQ1ybn6e0oAIdmmx__VA204
Message-ID: <CAEAWyHctmc26umq4W4NJUo+pJRw24V1-T98USjmY6-Ge09xkPg@mail.gmail.com>
Subject: Re: [PATCH v2 net 0/9] net: enetc: SR-IOV robustness and security fixes
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	catalin.horghidan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 8:03=E2=80=AFPM Wei Fang <wei.fang@nxp.com> wrote:
>
> This patch series addresses a number of robustness, security, and
> correctness issues in the ENETC driver's SR-IOV subsystem, focusing
> primarily on the VF-to-PF mailbox communication path.
>
> The series can be grouped into the following categories:
>
> 1. DoS and security fixes:
>    - Prevent an unbounded loop DoS in the VF-to-PF message handler,
>      which could be triggered by a malicious or misbehaving VF.
>    - Fix a TOCTOU (Time-of-Check-Time-of-Use) race and add proper
>      validation of VF MAC addresses to prevent spoofing or invalid
>      configuration from being applied.
>
> 2. Race condition fixes:
>    - Fix a race condition in VF MAC address configuration that could
>      lead to inconsistent state between the VF request and PF
>      application.
>    - Fix a race condition during SR-IOV teardown that could cause
>      VF->PF mailbox operations to time out, resulting in unnecessary
>      errors during shutdown.
>
> 3. Memory safety fixes:
>    - Fix a DMA write to freed memory in enetc_msg_free_mbx(), which
>      could cause silent memory corruption or system instability.
>
> 4. Error handling and initialization fixes:
>    - Fix missing error code propagation when pf->vf_state allocation
>      fails, ensuring callers receive a proper errno instead of
>      succeeding silently.
>    - Fix incorrect mailbox message status values returned to VFs,
>      which could cause VFs to misinterpret PF responses.
>    - Fix initialization order to prevent the use of uninitialized
>      resources during driver probe, which could cause undefined
>      behavior on certain configurations.
>
> 5. Diagnostics improvement:
>    - Add rate limiting to VF mailbox error messages to prevent log
>      flooding in the presence of a misbehaving VF.
>
> These fixes improve the overall stability and security of the ENETC
> SR-IOV implementation, particularly in multi-tenant environments where
> VFs may be assigned to untrusted guests.
>
> ---
> v2:
> 1. Copy the message content from DMA memory to local memory
> 2. Patch 3 and 5 in v1 are merged into patch 8 in v2
> 3. Add more fix patches, such as patch 1, 2, 6 and 7
> v1 link: https://lore.kernel.org/imx/20260513103021.2190593-1-wei.fang@nx=
p.com/
> ---
>
> Wei Fang (9):
>   net: enetc: fix incorrect mailbox message status returned to VFs
>   net: enetc: fix missing error code when pf->vf_state allocation fails
>   net: enetc: add ratelimiting to VF mailbox error messages
>   net: enetc: fix TOCTOU race and validate VF MAC address
>   net: enetc: fix race condition in VF MAC address configuration
>   net: enetc: fix DMA write to freed memory in enetc_msg_free_mbx()
>   net: enetc: fix VF-to-PF message handler unbounded loop DoS
>   net: enetc: fix initialization order to prevent use of uninitialized
>     resources
>   net: enetc: avoid VF->PF mailbox timeout during SR-IOV teardown

Resending to the correct thread.

This v2 series LGTM. If the commit message for patch 8 is updated,
feel free to add:

Reviewed-by: Harshitha Ramamurthy <hramamurthy@google.com>

>
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |  1 +
>  .../net/ethernet/freescale/enetc/enetc_msg.c  | 79 ++++++++++---------
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 75 +++++++++++++-----
>  .../net/ethernet/freescale/enetc/enetc_pf.h   |  1 +
>  4 files changed, 98 insertions(+), 58 deletions(-)
>
> --
> 2.34.1
>
>
