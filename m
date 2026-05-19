Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320433FC5D6
	for <imx@lists.linux.dev>; Tue, 19 May 2026 17:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210950; cv=pass; b=Yn2gZrx13Txg8Hnd05AC3rwV6m91OVgaJ+qeTmASLjelyTMvX6o3wWh1hc28mkCNdtsL+Bwr6oB7vGDej+v1Vpi/gLqRa5X3ct+h7e0yD5Ohh/m2DdcNZ/ZlgmHJMpYvcfZIrHr+mYR1lPGLH4+t5GktjLcq3cjsArFUAPrJv+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210950; c=relaxed/simple;
	bh=/0+dScbTUNEJGVDgwal5JUJ0gDF/D9hpkgWOKCeMMaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLT52DAKZJowbh1Og+X4LC3o3ezd9GY0VvAjrsyg8NSBTFjdGjH1zn1ump98ZPvi9vHsIti/uc2w5BfOKBVkFw03Fi1Ozg12nRHhLTaaqZOh0UrG16/tSdFuQGXsBm9rk9kAX23WzW1O3YqayLjhK9G6Hzy/qRdLiFM+o7AB/2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uvspCQIQ; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uvspCQIQ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba180a022dso115ad.1
        for <imx@lists.linux.dev>; Tue, 19 May 2026 10:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779210947; cv=none;
        d=google.com; s=arc-20240605;
        b=HfsngSsr2kyO5AVWyCjpffXmhCl4FfD3uXeRwvHhcWprZa25SVr0TGJ7RZ/9HwPzjg
         +JKCDtla6F0LKBzBhaIMKTR3Ld+4B/k09kdL31vr7JqHw54bas72DOH+j7PaSDk6Nhcz
         7U59UZX4vxuP8wRL37C8T9bDJ2WnzTrJW4v7ZDRqBC+cS7awYbBmUopvxHbfkQMJjsvS
         Z1WAoHcXOslWfbqiP7jgBLZ10k8cK7ZQoQX19bLLz4gJ5O/VIuS+Vu//6T4XtSKltPVa
         VaNT8sErg78/cSr8Wjjj6t9q1E67bLmKQkEj/NbkXduYxCrUctNFpOJT4cZthaXJX2e/
         t/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cuQNgYy+WG+dzOE/c8QzcyHW5Fy6rAQMouLvUCWrgMI=;
        fh=zhERmdrpxVZKCX5qc7ol63YISq6xR8mTLjRoT1nc7uo=;
        b=hsMhpXsONMn6OvdoyG89TxjADXYpLg2w4DJjkBCSEVRYoocbfwOfIPWHBwskinaB1x
         Fv9oUlX8k0/JFR9SsPpSPgkXG2E2xGELzCFumiTG8S+nswQNKemL61VcoroENxrvfvVN
         1wQGoGzX1uIVFG0QBq9AJTXFCz3JGibTU+PCDBrjBF7j7wVtS5bmj8+isH+YWrV09P8v
         sTwlGlYz0xuyJkHLShkEoFTrsnkbY6T7gd0V557L2gYTLHHMvk2ha9IoL7yQtxcmqarV
         bhAor2SaNXoN0z0VeUIkvxgEU96MQO5Gj4uPl1LH7hLrsfH0nhldnw/6fCHRSHgEuth8
         o/eA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779210947; x=1779815747; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuQNgYy+WG+dzOE/c8QzcyHW5Fy6rAQMouLvUCWrgMI=;
        b=uvspCQIQGWH5eBofIcr5Nqc611QJOxeLHDd++Kcjnc2leqoAmvWk02cJxsCzzyO5Qq
         gHSsVDtT4hfKviqdKvDareCg34lRpWANOo0Ue8s9h4/Y+O++6E0BNb/bl4O42k2Mweru
         eyi7ILJRCPGMWgOxm5Fo1xEmGk8Vnd8FJxgb0Pejs6fXd/00ouNtQwVtURdJps/UMcHU
         LCZ5LP3rQgeT1hw1M8BqJ3L+RIcxD4Qpy4HUjy6B9zJfg2cU4OL+kFhJY03/XPRHW9d4
         1CQlB3AtZv/+lC0YycsimYQADDVjxCreE5PMJNZxKM7L0YIGvvlUuwy5VRSJfAlYYBlz
         MLgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210947; x=1779815747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuQNgYy+WG+dzOE/c8QzcyHW5Fy6rAQMouLvUCWrgMI=;
        b=UJe3A1ujmfoIOrqnctiDkikmsQxixdsAoyweriklXILsw+i1mGXZs1kwvFMQ/F31/u
         l4xgk5AYSrwLjwaPUBEo4MUGFpLgFw+28+TLCko91nW1/5sQ4quN47sD4ThblbrVTpnb
         9pQtiK+mBhXaZXfrDRCscz1B9KGyPv8HsY6mnXrFim9QJ/aLelA88Qz1FzADaIeai/pV
         muGWUrsipj1b4x0Parh+OmiqYDlMmb3Ei5IhXPxCt6p1wsdw4n6ODzxZ4jA0h1n0vSZ3
         Jx5is8eGIlEK5/aX26Cg8upYE8BWOGWYPdaSacnun4AJwCPZKykEnZ+i8xGTyIAkjcyv
         gCHA==
X-Forwarded-Encrypted: i=1; AFNElJ/NXTizbkSidEUbzQgQ2FCBQ8qkbPubMDhsuNqBh/gePb4yNCm3TswTGVuhgNexi8CJV04=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1+xKDkWAbHcZFQN8FU1QWifzsFc1aVJJfBEb7D4fgWEfaT0aH
	nvRHcg4WhHOzZwbvPjoy12j8WAvfWpw66jBINWeFUOoLHwLMfjfBIehX6J7c510O9l9VO4WA62x
	xpsTSmCHlnSifm0rngtJzElYmOc7dboGbhu7euDxs
X-Gm-Gg: Acq92OEF5ONPZDpUJoYWLfviGIKqdwEF18zwJlLm6b5M8B1qTR6lU709SZQkjlJIhO4
	3fyP5FBN5kK9i1hIDh22Rb27W1a3z6Uwq27kTugYUTGT5s5Qzmy4KfDb+Che60iLYi5/D5uXXH2
	QVA2wAaSopBsvsvvSlEqEq0hRXKuL/kymRyogVefAmNFxfHMzqdR4EPE1tXKocVEena8Q+q8uMe
	jloe2yiGXe0BeRvmxV48dc3cwytSMQMPsUSgP9OU5hhPdhPAr8jbU1t1cIoDBukOY137IdY13fY
	/v96onp8SNoS4M4t03Hi28U+Kb8BBizO3d+FRrkuGouolmkTqyWTL6PuqfhdOG2rypQSaQzztZX
	Znta1ewM9D39kSlRz
X-Received: by 2002:a17:902:cf0d:b0:2b4:6529:7bae with SMTP id
 d9443c01a7336-2bdb329b56bmr6839545ad.17.1779210946312; Tue, 19 May 2026
 10:15:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260518030535.1057228-1-wei.fang@nxp.com> <20260518030535.1057228-9-wei.fang@nxp.com>
In-Reply-To: <20260518030535.1057228-9-wei.fang@nxp.com>
From: Harshitha Ramamurthy <hramamurthy@google.com>
Date: Tue, 19 May 2026 10:15:34 -0700
X-Gm-Features: AVHnY4LtmoXAhWXvNiu-0-asmSu8v-CvGeSzm-1g8vS_8O9j5-ZboIjVtfmFLj4
Message-ID: <CAEAWyHfk7y691oYNmYy5W8dA8cnpwG4ejnXPssMLOUO+Ljo24g@mail.gmail.com>
Subject: Re: [PATCH v2 net 8/9] net: enetc: fix initialization order to
 prevent use of uninitialized resources
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, imx@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	catalin.horghidan@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 8:09=E2=80=AFPM Wei Fang <wei.fang@nxp.com> wrote:
>
> Sashiko reported a potential issue in enetc_msg_psi_init() where the IRQ
> handler is registered before DMA resources are fully initialized [1].
>
> The current initialization sequence is:
>
>   1. request_irq(enetc_msg_psi_msix)    <- IRQ handler registered
>   2. INIT_WORK(&pf->msg_task, ...)      <- work_struct initialized
>   3. enetc_msg_alloc_mbx()              <- mailbox DMA allocated
>
> This ordering is unsafe because if a spurious interrupt or pending
> interrupt from a previous device state fires immediately after
> request_irq() returns, the registered ISR enetc_msg_psi_msix() will
> execute and unconditionally call:
>
>   schedule_work(&pf->msg_task)
>
> At this point, pf->msg_task has not been initialized by INIT_WORK(), so
> the work_struct contains garbage values in its internal linked list
> pointers (work_struct->entry). Passing an uninitialized work_struct to
> schedule_work() could corrupt the kernel's workqueue linked lists,
> potentially leading to:
>
>   - Kernel panic in __queue_work()
>   - Memory corruption in workqueue data structures
>   - System deadlock or undefined behavior
>
> Additionally, even if the work_struct were initialized, the mailbox DMA
> buffers (pf->rxmsg[]) may not yet be allocated when the work handler
> enetc_msg_task() runs, resulting in NULL pointer dereference.
>
> Fix by reordering the initialization sequence to ensure all resources are
> properly initialized before the interrupt handler can execute:
>
>   1. enetc_msg_alloc_mbx()              <- Allocate all mailboxes
>   2. INIT_WORK(&pf->msg_task, ...)      <- Initialize work first
>   3. request_irq(enetc_msg_psi_msix)    <- Register IRQ last
>   4. Configure hardware & enable MR interrupts
>
> This guarantees that when enetc_msg_psi_msix() runs:
>   - pf->msg_task is properly initialized (safe for schedule_work)
>   - pf->rxmsg[] buffers are allocated (safe for work handler access)
>   - Hardware is configured appropriately
>
> Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40=
nxp.com #1
> Fixes: beb74ac878c8 ("enetc: Add vf to pf messaging support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc_msg.c  | 35 ++++++++++---------
>  1 file changed, 18 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 39f057fe85c7..a999f1e7817f 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -109,6 +109,15 @@ int enetc_msg_psi_init(struct enetc_pf *pf)
>         struct enetc_si *si =3D pf->si;
>         int vector, i, err;
>
> +       for (i =3D 0; i < pf->num_vfs; i++) {
> +               err =3D enetc_msg_alloc_mbx(si, i);
> +               if (err)
> +                       goto free_mbx;
> +       }
> +
> +       /* initialize PSI mailbox */
> +       INIT_WORK(&pf->msg_task, enetc_msg_task);
> +
>         /* register message passing interrupt handler */
>         snprintf(pf->msg_int_name, sizeof(pf->msg_int_name), "%s-vfmsg",
>                  si->ndev->name);
> @@ -117,32 +126,21 @@ int enetc_msg_psi_init(struct enetc_pf *pf)
>         if (err) {
>                 dev_err(&si->pdev->dev,
>                         "PSI messaging: request_irq() failed!\n");
> -               return err;
> +               goto free_mbx;
>         }
>
>         /* set one IRQ entry for PSI message receive notification (SI int=
) */
>         enetc_wr(&si->hw, ENETC_SIMSIVR, ENETC_SI_INT_IDX);
>
> -       /* initialize PSI mailbox */
> -       INIT_WORK(&pf->msg_task, enetc_msg_task);
> -
> -       for (i =3D 0; i < pf->num_vfs; i++) {
> -               err =3D enetc_msg_alloc_mbx(si, i);
> -               if (err)
> -                       goto err_init_mbx;
> -       }
> -
>         /* enable MR interrupts */
>         enetc_msg_enable_mr_int(&si->hw);
>
>         return 0;
>
> -err_init_mbx:
> +free_mbx:
>         for (i--; i >=3D 0; i--)
>                 enetc_msg_free_mbx(si, i);
>
> -       free_irq(vector, si);
> -
>         return err;
>  }
>
> @@ -151,14 +149,17 @@ void enetc_msg_psi_free(struct enetc_pf *pf)
>         struct enetc_si *si =3D pf->si;
>         int i;
>
> +       /* disable MR interrupts */
> +       enetc_msg_disable_mr_int(&si->hw);
> +
> +       /* de-register message passing interrupt handler */
> +       free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
> +
>         cancel_work_sync(&pf->msg_task);
>
> -       /* disable MR interrupts */
> +       /* MR interrupts may be re-enabled by workqueue */
>         enetc_msg_disable_mr_int(&si->hw);
>
>         for (i =3D 0; i < pf->num_vfs; i++)
>                 enetc_msg_free_mbx(si, i);
> -
> -       /* de-register message passing interrupt handler */
> -       free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);

Code looks good to me but a nit: would be good if the change here in
enetc_msg_psi_free() is also called out in the commit message.

>  }
> --
> 2.34.1
>
>
