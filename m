Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048957EA
	for <imx@lists.linux.dev>; Thu,  6 Oct 2022 10:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1665051693;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E8PQYrKuK2/Hl24+POgcwMXBNTM5dRPCyF3STm9qM0g=;
	b=XFQNpsqIYnHkIMEv7FvRLzc+qPQpuCYOa883N5EmfMMeif2dfAfRAdKyk1rSr8DoPJ/Y7Q
	K+K/1CdfUBNa/i8rs1LrvkrsgIOEM7k541NsnnKISkpWO40ii5zmH1QNnt4HXG3krzD6PL
	SYvD8vvS0W2JeEZVFM5AN26rpYw87j8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-395-6QzoFy1NO324aqqXrQc8og-1; Thu, 06 Oct 2022 06:21:30 -0400
X-MC-Unique: 6QzoFy1NO324aqqXrQc8og-1
Received: by mail-wm1-f71.google.com with SMTP id r188-20020a1c44c5000000b003be06269377so888896wma.6
        for <imx@lists.linux.dev>; Thu, 06 Oct 2022 03:21:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=E8PQYrKuK2/Hl24+POgcwMXBNTM5dRPCyF3STm9qM0g=;
        b=qyjsL+RQO5vPjCEXNPbGUUE7SsaPruXUsCu3kq84+00M5kz2zrGyvjk8JS6DeFarmb
         EFxxL52RGs52oMB0sthIvYzpV2ChyMtsCSV7mNqqT7z+yG+IsEWYe+ASrONxLZecGXwV
         eSsCBQl7I4IuUMNGHfgAyhfJrx+wf4hRtNRnZ4Ux4Sv24a347z9/Omxa6sYNdxWqP2qY
         CAUj+bpZgNQH8GPazZ6zH/UaDbT8ktNHa7IDMTExDLFMcRTiZ8gsPM12pAXiZx2715Mv
         P/Yz0firw5ovggvmKnDEnvkkR0/S4eyYUyTVwmMpJR0kDvCeGCXDsgwzquRaK4xb4RFW
         ruqA==
X-Gm-Message-State: ACrzQf1H5ielkoUJkzY/57SOCnLFme0tkYtBbHYixCRwrIsNYU/Q7xDn
	erfIXvwPO69jrWwI0qX94phvdMM9134RCpZMF/HdYh8csJKoT5IVIyu+WXtnFjBuu3bE9XK1e2s
	tAj9dQMl7jhUe
X-Received: by 2002:a05:600c:524d:b0:3b4:8ad0:6d with SMTP id fc13-20020a05600c524d00b003b48ad0006dmr2717402wmb.194.1665051689861;
        Thu, 06 Oct 2022 03:21:29 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JVp31HaP/KRmbGPg8W12uqDcUB44zqvkXc5dl9LvnPr4lypZ4E1+srBSYlpGawuBaeq/W6g==
X-Received: by 2002:a05:600c:524d:b0:3b4:8ad0:6d with SMTP id fc13-20020a05600c524d00b003b48ad0006dmr2717390wmb.194.1665051689673;
        Thu, 06 Oct 2022 03:21:29 -0700 (PDT)
Received: from gerbillo.redhat.com (146-241-103-235.dyn.eolo.it. [146.241.103.235])
        by smtp.gmail.com with ESMTPSA id n25-20020a05600c3b9900b003a5ffec0b91sm4888829wms.30.2022.10.06.03.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 03:21:29 -0700 (PDT)
Message-ID: <b265d1b7bfcc602f6257877dc430bf89a0323e08.camel@redhat.com>
Subject: Re: [PATCH 1/1] net: fec: remove the unused functions
From: Paolo Abeni <pabeni@redhat.com>
To: Shenwei Wang <shenwei.wang@nxp.com>, "David S . Miller"
	 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	 <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>,  Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Wei Fang <wei.fang@nxp.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,  imx@lists.linux.dev
Date: Thu, 06 Oct 2022 12:21:28 +0200
In-Reply-To: <20221005131109.356046-1-shenwei.wang@nxp.com>
References: <20221005131109.356046-1-shenwei.wang@nxp.com>
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

On Wed, 2022-10-05 at 08:11 -0500, Shenwei Wang wrote:
> Removed those unused functions since we simplified the driver
> by using the page pool to manage RX buffers.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>

This looks net-next material.

The merge window has now started (after Linus tagged 6.0)
and will last until he tags 6.1-rc1 (~10 days from now). During this
time we'll not be taking any patches for net-next so
please repost in around 2 weeks.

When you will repost, please include the target tree into the subj.

Thanks,

Paolo

